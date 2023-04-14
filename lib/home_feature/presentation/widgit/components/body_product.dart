import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_application/categories_feature/remote_data_source/categories_model/categories_model.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/home_feature/controller/change_favorte_cubit/change_favorte_cubit.dart';
import 'package:shop_application/home_feature/controller/change_favorte_cubit/change_favorte_states.dart';
import 'package:shop_application/home_feature/controller/products_cubit/product_cubit.dart';
import 'package:shop_application/home_feature/controller/products_cubit/product_states.dart';
import 'package:shop_application/home_feature/presentation/widgit/components/build_catecory_item.dart';
import 'package:shop_application/home_feature/remote_data_source/model/home_model.dart';
import 'package:shop_application/products_details_feture/presentation/pages/products_detailes.dart';
import 'header_with_search_box.dart';

class Body extends StatelessWidget {
  final HomeModel model;
  final CategoriesModel categoriesModel;

  const Body({
    super.key,
    required this.model,
    required this.categoriesModel,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, ss) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWithSearchBox(size: size),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 100.0,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => BuildCategoryItem(
                            model: categoriesModel.data.data[index]),
                        //buildCategoryItem(categoriesModel.data.data[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10.0,
                        ),
                        itemCount: categoriesModel.data.data.length,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'New Products',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[300],
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  childAspectRatio: 1 / 1.6,
                  children: List.generate(
                    model.data.products.length,
                    (index) => BuildItemProduct(
                      model: model.data.products[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BuildItemProduct extends StatelessWidget {
  const BuildItemProduct({
    super.key,
    required this.model,
  });

  final ProductsBean model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsStates>(
      builder: (context, state) {
        return BlocConsumer<ChangeFavoriteCubit, ChangeFavoriteStates>(
            listener: (context, state) {
          if (state is SuccessChangeFavoriteState) {
            if (!state.model.status) {
              Fluttertoast.showToast(
                  msg: state.model.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        }, builder: (context, state) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductsDetailsScreen(
                            productId: model.id,
                          )));
            },
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Image(
                        image: NetworkImage(model.image),
                        width: double.infinity,
                        height: 200.0,
                      ),
                      if (model.discount != -1)
                        Container(
                          color: Colors.red,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: const Text(
                            'DISCOUNT',
                            style: TextStyle(
                              fontSize: 7.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            height: 1.3,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${model.price.round()}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: defaultColor,
                              ),
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            if (model.discount != -1)
                              Text(
                                '${model.old_price.round()}',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                ChangeFavoriteCubit.get(context).changeFavorite(
                                    productId: model.id, context: context);
                              },
                              icon: CircleAvatar(
                                radius: 16.0,
                                backgroundColor: favorites[model.id]!
                                    ? defaultColor
                                    : Colors.grey,
                                child: const Icon(
                                  Icons.favorite_border,
                                  size: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}

class TitleWithCustomUnderLine extends StatelessWidget {
  const TitleWithCustomUnderLine({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              height: 7,
              color: defaultColor.withOpacity(.2),
            ),
          ),
        ],
      ),
    );
  }
}
