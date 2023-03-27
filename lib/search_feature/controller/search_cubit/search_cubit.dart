import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/search_feature/controller/search_cubit/search_states.dart';
import 'package:shop_application/search_feature/remote_data_source/search_model/search_model.dart';
import 'package:shop_application/search_feature/remote_data_source/search_remote_data_source.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit(): super(InitialState());

  static SearchCubit get(BuildContext context)=>BlocProvider.of(context);


  void searchProduct({
    required String text,
}){
    emit(LoadingSearchState());
    SearchRemoteDataSource().searchProducts(data: {
      'text' : text
    }).then((value) {
      emit(SuccessSearchState(searchModel: SearchModel.fromJson(value.data)));
    }).catchError((error){
      print('search ${error.toString()}');
      emit(ErrorSearchState(error.toString()));
    });
  }
}