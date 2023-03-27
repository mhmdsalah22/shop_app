import 'package:shop_application/auth_feature/data/model/user_model.dart';

abstract class ProfileStates{}

class InitialState extends ProfileStates{}

class LoadingGetProfileState extends ProfileStates{}

class SuccessGetProfileState extends ProfileStates{
  final UserModel userModel;

  SuccessGetProfileState({required this.userModel});
}

class ErrorGetProfileState extends ProfileStates{
  final String error;

  ErrorGetProfileState(this.error);
}


class LoadingUpdateDataProfileState extends ProfileStates{}

class SuccessUpdateDataProfileState extends ProfileStates{
  final UserModel userModel;

  SuccessUpdateDataProfileState({required this.userModel});
}

class ErrorUpdateDataProfileState extends ProfileStates{
  final String error;

  ErrorUpdateDataProfileState(this.error);
}