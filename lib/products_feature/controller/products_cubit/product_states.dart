import 'package:shop_application/favorites_feature/remote_data_source/model/change_favorite_model.dart';

abstract class ProductsStates{}

class InitialProductsState extends ProductsStates{}

class LoadingProductsState extends ProductsStates{}

class SuccessProductsState extends ProductsStates{}

class ErrorProductsState extends ProductsStates{
  final String error;

  ErrorProductsState(this.error);
}

class ShopSuccessCategoriesState extends ProductsStates {}

class ShopErrorCategoriesState extends ProductsStates {}

class ShopChangeFavoritesState extends ProductsStates {
  final String error;

  ShopChangeFavoritesState(this.error);

}

class ChangeFavoriteState extends ProductsStates{}


class SuccessChangeFavoriteState extends ProductsStates{
  final ChangeFavoriteModel model;

  SuccessChangeFavoriteState({required this.model});
}

class ErrorChangeFavoriteState extends ProductsStates{
  final String error;

  ErrorChangeFavoriteState(this.error);
}
