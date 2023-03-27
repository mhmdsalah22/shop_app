
import 'package:shop_application/auth_feature/data/model/user_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final UserModel userModel;

  RegisterSuccessState({required this.userModel});
}

class RegisterErrorState extends RegisterStates
{
  final String error;

  RegisterErrorState(this.error);
}


class RegisterChangePasswordVisibilityState extends RegisterStates {}