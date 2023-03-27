import 'package:shop_application/auth_feature/data/model/user_model.dart';

abstract class LoginState{}

class InitialLoginState extends LoginState{}

class LoadingLoginState extends LoginState{}

class SuccessLoginState extends LoginState{
  final UserModel userModel;

  SuccessLoginState({required this.userModel});
}

class ErrorLoginState extends LoginState{
  final String error;
  

  ErrorLoginState({required this.error});
}

class RegisterChangePasswordVisibilityState extends LoginState {}