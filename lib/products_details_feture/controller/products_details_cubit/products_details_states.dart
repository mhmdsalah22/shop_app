import 'package:shop_application/products_details_feture/data_source/model/products_details_model.dart';

abstract class ProductsDetailsStates{}

class InitialState extends ProductsDetailsStates{}

class LoadingProductsDetailsState extends ProductsDetailsStates{}

class SuccessProductsDetailsState extends ProductsDetailsStates{
  final ProductsDetailsModel productsDetailsModel;

  SuccessProductsDetailsState({required this.productsDetailsModel});
}

class ErrorProductsDetailsState extends ProductsDetailsStates{
  final String error;

  ErrorProductsDetailsState(this.error);
}
