import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/categories_feature/remote_data_source/categories_model/categories_model.dart';
import 'package:shop_application/core/end_points.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/favorites_feature/controller/get_favorite_cubt/favorite_cubt.dart';
import 'package:shop_application/favorites_feature/remote_data_source/model/change_favorite_model.dart';
import 'package:shop_application/favorites_feature/remote_data_source/remote_data_source/remote_data_source.dart';
import 'package:shop_application/products_feature/controller/products_cubit/product_states.dart';
import 'package:shop_application/products_feature/remote_data_source/dio/remote_data_source.dart';
import 'package:shop_application/products_feature/remote_data_source/model/home_model.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(InitialProductsState());

  static ProductsCubit get(BuildContext context) => BlocProvider.of(context);

  HomeModel? homeModel;
  Map<int, bool> favorites = {};

  void getDataProducts() {
    emit(LoadingProductsState());
    HomeRemoteDataSource().getData(token: token, url: home).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel?.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      print(favorites.toString());
      emit(SuccessProductsState());
    }).catchError((error) {
      emit(ErrorProductsState(error.toString()));
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories() {
    HomeRemoteDataSource()
        .getData(
      url: categories,
    )
        .then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }


  void changeFavorite(int productId, context) {
    favorites[productId] = !favorites[productId]!;
    emit(ChangeFavoriteState());

    RemoteDataSourceFavorite().changeFavorite(url: Favorites, data: {
      'product_id': productId,
    }).then((value) {
      ChangeFavoriteModel model =ChangeFavoriteModel(status: true, message: '');
      if (! model.status) {
        favorites[productId] = !favorites[productId]!;
      }else{
        FavoriteCubit.get(context).getFavorites();
      }
      emit(SuccessChangeFavoriteState(model: ChangeFavoriteModel.fromJson(value.data)));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorChangeFavoriteState(error.toString()));
    });
  }
}
