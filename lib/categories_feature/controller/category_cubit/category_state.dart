abstract class CategoryStates{}

class InitialState extends CategoryStates{}


class ShopSuccessCategoriesState extends CategoryStates {}

class ShopErrorCategoriesState extends CategoryStates {}

class ShopChangeFavoritesState extends CategoryStates {
  final String error;

  ShopChangeFavoritesState(this.error);

}