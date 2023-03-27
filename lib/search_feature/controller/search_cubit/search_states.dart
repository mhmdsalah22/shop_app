import 'package:shop_application/search_feature/remote_data_source/search_model/search_model.dart';

abstract class SearchStates{}

class InitialState extends SearchStates{}

class LoadingSearchState extends SearchStates{}

class SuccessSearchState extends SearchStates
{
  final SearchModel searchModel;

  SuccessSearchState({required this.searchModel});
}

class ErrorSearchState extends SearchStates
{
  final String error;

  ErrorSearchState(this.error);
}
