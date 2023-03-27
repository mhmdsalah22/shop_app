import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/carts_feature/remote_data_source/model/add_delete_cart.dart';
import 'package:shop_application/carts_feature/remote_data_source/cart_remote_data_source/remote_data_source.dart';
import 'package:shop_application/carts_feature/remote_data_source/model/get_carts_model.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartStates>{
  CartCubit() : super(InitialState());
  
  static CartCubit get(BuildContext context)=>BlocProvider.of(context);
  
  void addDeleteCart({
    required int productId,
}){
    emit(LoadingAddDeleteCartState());
    CartRemoteDataSource().addDeleteCart(productId: productId).then((value) 
    {
      emit(SuccessAddDeleteCartState(addDeleteCart: AddDeleteCart.fromJson(value.data)));
      getCarts();
    }).catchError((error)
    {
      emit(ErrorAddDeleteCartState(error.toString()));
      print(error.toString());
    });
  }

  void getCarts()
  {
    emit(LoadingGetCartsState());
    CartRemoteDataSource().getCarts().then((value)
    {
      emit(SuccessGetCartsState(cartsModel: GetCartsModel.fromJson(value.data)));
    }).catchError((error)
    {
      print(error.toString());
      emit(ErrorGetCartsState(error.toString()));
    });
  }
}