// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shop_application/categories_feature/controller/category_cubit/category_state.dart';
// import '../../../core/end_points.dart';
// import '../../../products_feature/remote_data_source/dio/remote_data_source.dart';
// import '../../remote_data_source/categories_model/categories_model.dart';
//
// class CategoryCubit extends Cubit<CategoryStates> {
//   CategoryCubit() : super(InitialState());
//
//   static CategoryCubit get(BuildContext context) => BlocProvider.of(context);
//
//   CategoriesModel? categoriesModel;
//
//   void getCategories() {
//     HomeRemoteDataSource()
//         .getData(
//       url: categories,
//     )
//         .then((value) {
//       categoriesModel = CategoriesModel.fromJson(value.data);
//
//       emit(ShopSuccessCategoriesState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorCategoriesState());
//     });
//   }
// }
