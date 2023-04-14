import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/categories_feature/controller/category_cubit/category_cubit.dart';
import 'package:shop_application/categories_feature/controller/category_cubit/category_state.dart';
import 'package:shop_application/home_feature/controller/products_cubit/product_cubit.dart';
import 'package:shop_application/home_feature/controller/products_cubit/product_states.dart';
import '../widgit/components/body_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder< CategoryCubit , CategoryStates>(
      builder: (context, state) {
        return BlocConsumer<ProductsCubit, ProductsStates>(
          listener:(context, state) {
            //4
            // if (state is SuccessProductsState) {
            //   HomeRemoteDataSource().getData(token: token, url: home).then((value) {
            //     SuccessProductsState(homeModel: HomeModel.fromJson(value.data)).homeModel
            //         .data.products.forEach((element) {
            //       ChangeFavoriteCubit
            //           .get(context)
            //           .favorites
            //           .addAll({
            //         element.id: element.in_favorites,
            //       });
            //     });
            //   });
            // }
          } ,
          builder: (context, state) {
            if (state is SuccessProductsState) {
              return Body(
                model: state.homeModel,
                categoriesModel: CategoryCubit
                    .get(context)
                    .categoriesModel!,
              );
            }
            else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
