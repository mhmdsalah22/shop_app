import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/carts_feature/controller/get_cart_cubit/get_carts_cubit.dart';
import 'package:shop_application/carts_feature/remote_data_source/model/add_delete_cart.dart';
import 'package:shop_application/carts_feature/remote_data_source/cart_remote_data_source/remote_data_source.dart';
import 'add_product_to_cart_states.dart';

class AddProductToCartCubit extends Cubit<AddProductToCartStates> {
  AddProductToCartCubit() : super(InitialState());

  static AddProductToCartCubit get(BuildContext context) => BlocProvider.of(context);

  void addProductsToCart({
    required int productId,
    required BuildContext context
  }) {
    emit(LoadingAddDeleteCartState());
    CartRemoteDataSource().addDeleteCart(productId: productId).then((value) {
      emit(SuccessAddDeleteCartState(
          addProductToCart: AddProductTOCart.fromJson(value.data)));
      GetCartsCubit.get(context).getCarts();
    }).catchError((error) {
      emit(ErrorAddDeleteCartState(error.toString()));
      print(error.toString());
    });
  }

  // UpdateCartsModel? updateCartsModel;
  //
  // void getCarts() {
  //   emit(LoadingGetCartsState());
  //   CartRemoteDataSource().getCarts().then((value) {
  //     emit(
  //         SuccessGetCartsState(cartsModel: GetCartsModel.fromJson(value.data)));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ErrorGetCartsState(error.toString()));
  //   });
  // }
//
// //   void updateCart({
// //     required int quantity
// // })
// //   {
// //     emit(LoadingUpdateCartsState());
// //     CartRemoteDataSource().updateCart(quantity: quantity).then((value)
// //     {
// //       emit(SuccessUpdateCartsState(updateCartsModel: UpdateCartsModel.fromJson(value.data)));
// //     }).catchError((error)
// //     {
// //       print(error.toString());
// //       emit(ErrorUpdateCartsState(error.toString()));
// //     });
// //   }
//
//   int quantity = 1;
//
//   void plusProduct({required int cartId}) {
//     if (quantity >= 1) {
//       CartRemoteDataSource()
//           .updateCart(quantity: ++quantity, cartId: cartId)
//           .then((value) {
//         emit(
//             SuccessPlusUpdateCartsState(UpdateCartsModel.fromJson(value.data)));
//         getCarts();
//       }).catchError((error) {
//         emit(ErrorPlusUpdateCartsState(error.toString()));
//       });
//     } else if(quantity <= 0)  {
//       deleteCart(cartId: cartId);
//     }
//   }
//
//   void minusProduct({required int cartId}) {
//     if (quantity >= 1) {
//       CartRemoteDataSource()
//           .updateCart(quantity: --quantity, cartId: cartId)
//           .then((value) {
//         emit(SuccessMinusUpdateCartsState(
//             UpdateCartsModel.fromJson(value.data)));
//         getCarts();
//       }).catchError((error) {
//         emit(ErrorMinusUpdateCartsState(error.toString()));
//       });
//     } else if(quantity <= 0) {
//       deleteCart(cartId: cartId);
//     }
//   }

  // void deleteCart({
  //   required int cartId,
  // }) {
  //   CartRemoteDataSource().deleteCarts(cartId: cartId).then((value) {
  //     emit(SuccessDeleteCartsState(UpdateCartsModel.fromJson(value.data)));
  //   }).catchError((error) {
  //     emit(ErrorDeleteCartsState(error.toString()));
  //   });
  // }
}
