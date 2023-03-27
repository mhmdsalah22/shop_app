import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/auth_feature/controller/profile_cubit/profile_cubit.dart';
import 'package:shop_application/auth_feature/controller/profile_cubit/profile_states.dart';
import 'package:shop_application/auth_feature/presentation/pages/login_screen.dart';
import 'package:shop_application/core/network/local/cache_helper.dart';
import 'package:shop_application/core/utiles/contants.dart';

class SettingScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
            if (state is SuccessGetProfileState ) {
              nameController.text = state.userModel.data.name.toString();
              emailController.text = state.userModel.data.email.toString();
              phoneController.text = state.userModel.data.phone.toString();
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if (state is LoadingUpdateDataProfileState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'User Name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Email.';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Number';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Phone',
                          prefixIcon: Icon(Icons.phone_android),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: defaultColor,
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ProfileCubit.get(context).updateData(
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                              );
                            }
                          },
                          child: const Text(
                            'UPDATE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: defaultColor,
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            CacheHelper.removeData(key: 'token').then((value) {
                              if (value) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                    (route) => false);
                              }
                            });
                          },
                          child: const Text(
                            'LOGOUT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            );
        },
      ),
    );
  }
}
