import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_application/carts_feature/controller/cart_cubit/cart_cubit.dart';
import 'package:shop_application/carts_feature/controller/cart_cubit/cart_states.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/products_details_feture/controller/products_details_cubit/products_details_cubit.dart';
import 'package:shop_application/products_details_feture/controller/products_details_cubit/products_details_states.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({Key? key, required this.productId})
      : super(key: key);
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDetailsCubit()..getProductsDetails(id: productId),
      child: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          return BlocBuilder<ProductsDetailsCubit, ProductsDetailsStates>(
            builder: (context, state) {
              if (state is SuccessProductsDetailsState) {
                return Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    title:  const Text(
                      'Product Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.productsDetailsModel.data.name,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CarouselSlider(
                            items: state.productsDetailsModel.data.images
                                .map((e) => Image(
                                      image: NetworkImage(state
                                          .productsDetailsModel.data.image),
                                      //fit: BoxFit.cover,
                                      width: double.infinity,
                                    ))
                                .toList(),
                            options: CarouselOptions(
                              height: 200,
                              viewportFraction: 1.0,
                              enlargeCenterPage: false,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 1),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                '${state.productsDetailsModel.data.price.round()}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: defaultColor,
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              if (state.productsDetailsModel.data.discount != 0)
                                Text(
                                  '${state.productsDetailsModel.data.old_price.round()}',
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            state.productsDetailsModel.data.description,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            color: defaultColor,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                CartCubit.get(context).addDeleteCart(
                                    productId:
                                        state.productsDetailsModel.data.id);
                              },
                              child: Text(
                                state.productsDetailsModel.data.in_cart
                                    ? 'REMOVE FROM CART'
                                    : 'ADD TO CART',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              if (state is LoadingProductsDetailsState) {
                return Container(
                    color: Colors.white,
                    child: const Center(child: CircularProgressIndicator()));
              }
              if (state is ErrorProductsDetailsState) {
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
      ),
    );
  }
}
