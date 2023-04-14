import 'package:shop_application/home_feature/remote_data_source/model/home_model.dart';

abstract class ProductsStates{}

class InitialProductsState extends ProductsStates{}

class LoadingProductsState extends ProductsStates{}

class SuccessProductsState extends ProductsStates{
  final HomeModel homeModel;
  SuccessProductsState({required this.homeModel });

}

class ErrorProductsState extends ProductsStates{
  final String error;

  ErrorProductsState(this.error);
}
