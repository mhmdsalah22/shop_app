import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/auth_feature/controller/register_cubit/register_state.dart';
import 'package:shop_application/auth_feature/data/data_sources/remote_data_source_api.dart';
import 'package:shop_application/auth_feature/data/model/user_model.dart';
import 'package:shop_application/core/end_points.dart';
import 'package:shop_application/core/error/failure.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);



  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    try {
      await RemoteDataSourceApi().userData(url: register, data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      }).then((value) {
        emit(RegisterSuccessState(userModel: UserModel.fromJson(value.data)));
      });

    } catch (error) {
      emit(RegisterErrorState(error.toString()));
      throw ServerFailure(message: error.toString());
    }
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
}
