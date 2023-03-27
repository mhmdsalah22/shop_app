import 'package:shop_application/category_details_feature/data_source/model/category_detail_model.dart';

abstract class CategoryDetailsStates{}

class InitialState extends CategoryDetailsStates{}

class LoadingCategoryDetailsState extends CategoryDetailsStates{}

class SuccessCategoryDetailsState extends CategoryDetailsStates{
  final CategoryDetailModel categoryDetailModel;

  SuccessCategoryDetailsState({required this.categoryDetailModel});
}

class ErrorCategoryDetailsState extends CategoryDetailsStates
{
  final String error;

  ErrorCategoryDetailsState(this.error);

}