import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/products_details_feture/controller/products_details_cubit/products_details_states.dart';
import 'package:shop_application/products_details_feture/data_source/model/products_details_model.dart';
import 'package:shop_application/products_details_feture/data_source/remote_data_source/remote_data_source.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsStates>
{
  ProductsDetailsCubit() : super(InitialState());

  static ProductsDetailsCubit get(BuildContext context)=>BlocProvider.of(context);

  void getProductsDetails({
    required int id,
}){
    emit(LoadingProductsDetailsState());
    ProductsDetailsRemoteDataSource().getProductsDetails(productId: id).then((value)
    {
      emit(SuccessProductsDetailsState(productsDetailsModel: ProductsDetailsModel.fromJson(value.data)));
    }).catchError((error)
    {
      emit(ErrorProductsDetailsState(error));
      print(error);
    });
  }
}