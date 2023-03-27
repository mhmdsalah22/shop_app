import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/category_details_feature/controller/category_details_cubit/category_details_states.dart';
import 'package:shop_application/category_details_feature/data_source/model/category_detail_model.dart';
import 'package:shop_application/category_details_feature/data_source/remote_data_source/remote_data_source.dart';

class CategoryDetailCubit extends Cubit<CategoryDetailsStates> {
  CategoryDetailCubit() : super(InitialState());

  static CategoryDetailCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void getCategoryDetails({
    required int categoryID,
  }) {
    emit(LoadingCategoryDetailsState());
    CategoryDetailsRemoteDataSource()
        .categoryDetails(categoryId: categoryID)
        .then((value) {
      emit(SuccessCategoryDetailsState(
          categoryDetailModel: CategoryDetailModel.fromJson(value.data)));
    }).catchError((error) {
      emit(ErrorCategoryDetailsState(error.toString()));
      print(error.toString());
    });
  }
}
