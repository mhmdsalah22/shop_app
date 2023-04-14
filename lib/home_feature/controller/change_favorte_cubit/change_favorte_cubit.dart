import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/core/end_points.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/favorites_feature/controller/get_favorite_cubt/favorite_cubt.dart';
import 'package:shop_application/favorites_feature/remote_data_source/model/change_favorite_model.dart';
import 'package:shop_application/favorites_feature/remote_data_source/remote_data_source/remote_data_source.dart';
import 'package:shop_application/home_feature/controller/change_favorte_cubit/change_favorte_states.dart';

class ChangeFavoriteCubit extends Cubit<ChangeFavoriteStates>{
  ChangeFavoriteCubit() : super(InitialState());

  static ChangeFavoriteCubit get(BuildContext context)=>BlocProvider.of(context);



   ChangeFavoriteModel model = ChangeFavoriteModel(status: true, message: '');

  void changeFavorite({required int productId,required BuildContext context}) {
   favorites[productId] = ! favorites[productId]!;
    emit(ChangeFavoriteState());

    RemoteDataSourceFavorite().changeFavorite(url: Favorites, data: {
      'product_id': productId,
    }).then((value) {
      if (! model.status) {
        favorites[productId] = ! favorites[productId]!;
      }else{
        FavoriteCubit.get(context).getFavorites();
      }
      emit(SuccessChangeFavoriteState(model: ChangeFavoriteModel.fromJson(value.data)));
    }).catchError((error) {
      emit(ErrorChangeFavoriteState(error.toString()));
      print(error.toString());
    });
  }
}