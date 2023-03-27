import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/auth_feature/data/data_sources/remote_data_source_api.dart';
import 'package:shop_application/auth_feature/data/model/user_model.dart';
import 'package:shop_application/core/end_points.dart';
import 'package:shop_application/core/error/failure.dart';
import 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context)=>BlocProvider.of(context);
  void login(String email , String password)async{
    emit(LoadingLoginState());
    try {
     await RemoteDataSourceApi().userData(
       url: LOGIN,
       data: {
       'email':email,
       'password' : password,
     }).then((value) {
       emit(SuccessLoginState(userModel: UserModel.fromJson(value.data)));
     });
    }catch(error){
      emit(ErrorLoginState(error:  error.toString()));
      print('error  $error');
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
