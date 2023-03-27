import 'package:shop_application/carts_feature/remote_data_source/model/add_delete_cart.dart';
import 'package:shop_application/carts_feature/remote_data_source/model/get_carts_model.dart';

abstract class CartStates {}

class InitialState extends CartStates {}

class LoadingAddDeleteCartState extends CartStates {}

class SuccessAddDeleteCartState extends CartStates {
  final AddDeleteCart addDeleteCart;

  SuccessAddDeleteCartState({required this.addDeleteCart});
}

class ErrorAddDeleteCartState extends CartStates {
  final String error;

  ErrorAddDeleteCartState(this.error);
}

class LoadingGetCartsState extends CartStates{}

class SuccessGetCartsState extends CartStates{
  final GetCartsModel cartsModel;

  SuccessGetCartsState({ required this.cartsModel});
}

class ErrorGetCartsState extends CartStates{
  final String error;

  ErrorGetCartsState(this.error);
}