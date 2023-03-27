import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/favorites_feature/controller/get_favorite_cubt/favorite_cubt.dart';
import 'package:shop_application/favorites_feature/controller/get_favorite_cubt/favorite_states.dart';
import 'package:shop_application/favorites_feature/remote_data_source/model/favorites.dart';
import 'package:shop_application/products_details_feture/presentation/pages/products_detailes.dart';
import 'package:shop_application/products_feature/controller/products_cubit/product_cubit.dart';
import 'package:shop_application/products_feature/controller/products_cubit/product_states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsStates>(
      builder: (context, state) {
        return BlocConsumer<FavoriteCubit, FavoriteStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingGetFavoriteState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessGetFavoriteState) {
              return ListView.separated(
                itemBuilder: (context, index) => buildFavoriteItem(
                    state.favorites.data.data[index], context),
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                itemCount: state.favorites.data.data.length,
              );
            } else if (state is ErrorGetFavoriteState) {
              Fluttertoast.showToast(
                  msg: state.error,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}

Widget buildFavoriteItem(Data model, BuildContext context)
{
  // return BlocBuilder<ProductsCubit, ProductsStates>(
  //   builder: (context, state) {
  return GestureDetector(
    onTap: ()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductsDetailsScreen(productId: model.product.id,)));

    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.product.image),
                  width: 120.0,
                  height: 120.0,
                ),
                if (model.product.discount != 0 )
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: const Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '${model.product.price}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: defaultColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      if (model.product.discount != 0)
                        Text(
                          '${model.product.old_price}',
                          style: const TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          print('hi');
                          ProductsCubit.get(context)
                              .changeFavorite(model.product.id, context);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: ProductsCubit.get(context)
                                      .favorites[model.product.id] !=
                                  null
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
    ),
  );
}
