import 'package:shop_application/carts_feature/remote_data_source/model/get_carts_model.dart';

abstract class GetCartsStates{}

class InitialGetCartsState extends GetCartsStates{}


class LoadingGetCartsState extends GetCartsStates{}

class SuccessGetCartsState extends GetCartsStates{
  final GetCartsModel cartsModel;
  SuccessGetCartsState({ required this.cartsModel});
}

class ErrorGetCartsState extends GetCartsStates{
  final String error;

  ErrorGetCartsState(this.error);
}