import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/products_feature/controller/products_cubit/product_cubit.dart';
import 'package:shop_application/products_feature/controller/products_cubit/product_states.dart';
import '../widgit/components/body_product.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProductsCubit.get(context);
        return cubit.homeModel != null && cubit.categoriesModel != null
            ? Body(
                model: cubit.homeModel!,
                categoriesModel: cubit.categoriesModel!,
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
