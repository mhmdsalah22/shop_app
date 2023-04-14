import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/carts_feature/controller/get_cart_cubit/get_carts_states.dart';
import 'package:shop_application/carts_feature/remote_data_source/cart_remote_data_source/remote_data_source.dart';
import 'package:shop_application/carts_feature/remote_data_source/model/get_carts_model.dart';

class GetCartsCubit extends Cubit<GetCartsStates>{
  GetCartsCubit():super(InitialGetCartsState());

  static GetCartsCubit get(BuildContext context) => BlocProvider.of(context);


  void getCarts() {
    emit(LoadingGetCartsState());
    CartRemoteDataSource().getCarts().then((value) {
      emit(
          SuccessGetCartsState(cartsModel: GetCartsModel.fromJson(value.data)));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetCartsState(error.toString()));
    });
  }
}