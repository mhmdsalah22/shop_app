import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/favorites_feature/remote_data_source/model/favorites.dart';
import 'package:shop_application/favorites_feature/remote_data_source/remote_data_source/remote_data_source.dart';
import 'favorite_states.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(InitialState());

  static FavoriteCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void getFavorites(){
    emit(LoadingGetFavoriteState());
    RemoteDataSourceFavorite().getFavorite().then((value){
      emit(SuccessGetFavoriteState(favorites:  Favorites.fromJson(value.data)));
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetFavoriteState(error));
    });
  }
}
