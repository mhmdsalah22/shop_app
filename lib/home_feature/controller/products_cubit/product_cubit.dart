import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/core/end_points.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/home_feature/controller/products_cubit/product_states.dart';
import 'package:shop_application/home_feature/remote_data_source/dio/remote_data_source.dart';
import 'package:shop_application/home_feature/remote_data_source/model/home_model.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(InitialProductsState());

  static ProductsCubit get(BuildContext context) => BlocProvider.of(context);
  // Map<int, bool> favorites = {};

  void getDataProducts() {
    emit(LoadingProductsState());
    HomeRemoteDataSource().getData(token: token, url: home).then((value) {
      emit(SuccessProductsState(homeModel: HomeModel.fromJson(value.data)));
      SuccessProductsState(homeModel:HomeModel.fromJson(value.data)).homeModel.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.in_favorites,
        });
      });
    }).catchError((error) {
      emit(ErrorProductsState(error.toString()));
      print(error.toString());
    });
  }

  // CategoriesModel? categoriesModel;
  // void getCategories() {
  //   HomeRemoteDataSource()
  //       .getData(
  //     url: categories,
  //   ).then((value) {
  //     categoriesModel = CategoriesModel.fromJson(value.data);
  //     emit(ShopSuccessCategoriesState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ShopErrorCategoriesState(error.toString()));
  //   });
  // }

  // ChangeFavoriteModel model =ChangeFavoriteModel(status: true, message: '');
  //
  // void changeFavorite(int productId, context) {
  //   favorites[productId] = !favorites[productId]!;
  //   emit(ChangeFavoriteState());
  //
  //   RemoteDataSourceFavorite().changeFavorite(url: Favorites, data: {
  //     'product_id': productId,
  //   }).then((value) {
  //     if (! model.status) {
  //       favorites[productId] = !favorites[productId]!;
  //     }else{
  //       FavoriteCubit.get(context).getFavorites();
  //     }
  //     emit(SuccessChangeFavoriteState(model: ChangeFavoriteModel.fromJson(value.data)));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ErrorChangeFavoriteState(error.toString()));
  //     print(error.toString());
  //   });
  // }
}
