import 'package:shop_application/carts_feature/remote_data_source/model/add_delete_cart.dart';




abstract class AddProductToCartStates {}

class InitialState extends AddProductToCartStates {}

class LoadingAddDeleteCartState extends AddProductToCartStates {}

class SuccessAddDeleteCartState extends AddProductToCartStates {
  final AddProductTOCart addProductToCart;

  SuccessAddDeleteCartState({required this.addProductToCart});
}

class ErrorAddDeleteCartState extends AddProductToCartStates {
  final String error;

  ErrorAddDeleteCartState(this.error);
}
//
//
// class LoadingUpdateCartsState extends CartStates{}
//
// class SuccessUpdateCartsState extends CartStates{
//   final UpdateCartsModel updateCartsModel;
//
//   SuccessUpdateCartsState({required this.updateCartsModel});
// }
//
// class ErrorUpdateCartsState extends CartStates{
//   final String error;
//
//   ErrorUpdateCartsState(this.error);
// }
//
// class SuccessPlusUpdateCartsState extends CartStates{
//   final UpdateCartsModel updateCartsModel;
//
//   SuccessPlusUpdateCartsState(this.updateCartsModel);
//
// }
//
//
// class ErrorPlusUpdateCartsState extends CartStates{
//   final String error;
//
//   ErrorPlusUpdateCartsState(this.error);
// }
//
// class SuccessMinusUpdateCartsState extends CartStates{
//   final UpdateCartsModel updateCartsModel;
//
//   SuccessMinusUpdateCartsState(this.updateCartsModel);
//
// }
//
//
// class ErrorMinusUpdateCartsState extends CartStates{
//   final String error;
//
//   ErrorMinusUpdateCartsState(this.error);
// }
//
//
// class SuccessDeleteCartsState extends CartStates{
//   final UpdateCartsModel updateCartsModel;
//
//   SuccessDeleteCartsState(this.updateCartsModel);
//
// }
//
//
// class ErrorDeleteCartsState extends CartStates{
//   final String error;
//
//   ErrorDeleteCartsState(this.error);
// }
