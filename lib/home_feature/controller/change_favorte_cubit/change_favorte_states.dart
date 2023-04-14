import 'package:shop_application/favorites_feature/remote_data_source/model/change_favorite_model.dart';

abstract class ChangeFavoriteStates{}

class InitialState extends ChangeFavoriteStates {}


// class ShopChangeFavoritesState extends ChangeFavoriteStates {
//   final String error;
//
//   ShopChangeFavoritesState(this.error);
//
// }

class ChangeFavoriteState extends ChangeFavoriteStates{}


class SuccessChangeFavoriteState extends ChangeFavoriteStates{
  final ChangeFavoriteModel model;

  SuccessChangeFavoriteState({required this.model});
}

class ErrorChangeFavoriteState extends ChangeFavoriteStates{
  final String error;

  ErrorChangeFavoriteState(this.error);
}
