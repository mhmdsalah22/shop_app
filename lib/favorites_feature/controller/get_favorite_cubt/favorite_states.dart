import 'package:shop_application/favorites_feature/remote_data_source/model/favorites.dart';

abstract class FavoriteStates{}

class InitialState extends FavoriteStates{}

class LoadingGetFavoriteState extends FavoriteStates{}

class SuccessGetFavoriteState extends FavoriteStates{
  final Favorites favorites;

  SuccessGetFavoriteState({required this.favorites});
}

class ErrorGetFavoriteState extends FavoriteStates{
  final String error;

  ErrorGetFavoriteState(this.error);
}
