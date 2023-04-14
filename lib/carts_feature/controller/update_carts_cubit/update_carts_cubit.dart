import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/carts_feature/controller/delete_cart_cubit/delete_cart_cubit.dart';
import 'package:shop_application/carts_feature/controller/get_cart_cubit/get_carts_cubit.dart';
import 'package:shop_application/carts_feature/controller/update_carts_cubit/update_carts_states.dart';
import 'package:shop_application/carts_feature/remote_data_source/cart_remote_data_source/remote_data_source.dart';
import 'package:shop_application/carts_feature/remote_data_source/model/update_carts_model.dart';

class UpdateCartsCubit extends Cubit<UpdateCartsStates>{
  UpdateCartsCubit(): super(InitialUpdateCartsStates());
  static UpdateCartsCubit get(BuildContext context)=>BlocProvider.of(context);

  int quantity = 1;

  void plusProduct({required int cartId, required BuildContext context}) {
    if (quantity >= 1) {
      CartRemoteDataSource()
          .updateCart(quantity: ++quantity, cartId: cartId)
          .then((value) {
        emit(
            SuccessPlusUpdateCartsState(UpdateCartsModel.fromJson(value.data)));
        GetCartsCubit.get(context).getCarts();
      }).catchError((error) {
        emit(ErrorPlusUpdateCartsState(error.toString()));
      });
    } else if(quantity <= 0)  {
      DeleteCartCubit.get(context).deleteCart(cartId: cartId, context: context);
    }
  }

  void minusProduct({required int cartId , required BuildContext context }) {
    if (quantity >= 1) {
      CartRemoteDataSource()
          .updateCart(quantity: --quantity, cartId: cartId)
          .then((value) {
        emit(SuccessMinusUpdateCartsState(
            UpdateCartsModel.fromJson(value.data)));
        GetCartsCubit.get(context).getCarts();
      }).catchError((error) {
        emit(ErrorMinusUpdateCartsState(error.toString()));
      });
    } else if(quantity <= 0) {
      DeleteCartCubit.get(context).deleteCart(cartId: cartId, context: context);
    }
  }

}