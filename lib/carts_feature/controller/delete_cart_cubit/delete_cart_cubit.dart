import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/carts_feature/controller/delete_cart_cubit/delete_cart_states.dart';
import 'package:shop_application/carts_feature/controller/get_cart_cubit/get_carts_cubit.dart';
import 'package:shop_application/carts_feature/remote_data_source/cart_remote_data_source/remote_data_source.dart';
import 'package:shop_application/carts_feature/remote_data_source/model/update_carts_model.dart';

class DeleteCartCubit extends Cubit<DeleteCartStates>{
  DeleteCartCubit():super(InitialDeleteCartState());

  static DeleteCartCubit get(BuildContext context)=>BlocProvider.of(context);
  void deleteCart({
    required int cartId,
    required BuildContext context,
  }) {
    CartRemoteDataSource().deleteCarts(cartId: cartId).then((value) {
      emit(SuccessDeleteCartsState(UpdateCartsModel.fromJson(value.data)));
      GetCartsCubit.get(context).getCarts();
    }).catchError((error) {
      emit(ErrorDeleteCartsState(error.toString()));
      print(error.toString());
    });
  }
}