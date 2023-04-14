import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_application/carts_feature/controller/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';
import 'package:shop_application/carts_feature/controller/add_product_to_cart_cubit/add_product_to_cart_states.dart';
import 'package:shop_application/carts_feature/presentation/pages/cart_screen.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/home_feature/controller/products_cubit/product_cubit.dart';
import 'package:shop_application/home_feature/controller/products_cubit/product_states.dart';
import 'package:shop_application/products_details_feture/controller/products_details_cubit/products_details_cubit.dart';
import 'package:shop_application/products_details_feture/controller/products_details_cubit/products_details_states.dart';
import 'package:shop_application/products_details_feture/presentation/widget/favorite_button_in_product_detail_screen.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({Key? key, required this.productId})
      : super(key: key);
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDetailsCubit()..getProductsDetails(id: productId),
      child: BlocConsumer<AddProductToCartCubit, AddProductToCartStates>(
        listener: (context, state) {
          if (state is SuccessAddDeleteCartState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          }
        },
        builder: (context, state) {
          return BlocBuilder<ProductsCubit, ProductsStates>(
            builder: (context, state) {
              return BlocBuilder<ProductsDetailsCubit, ProductsDetailsStates>(
                builder: (context, state) {
                  if (state is SuccessProductsDetailsState) {
                    return Scaffold(
                      body: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                height:
                                    MediaQuery.of(context).size.height / 1.7,
                                child: Stack(
                                  children: [
                                    CarouselSlider(
                                      items:
                                          state.productsDetailsModel.data.images
                                              .map((e) => Image(
                                                    image: NetworkImage(state
                                                        .productsDetailsModel
                                                        .data
                                                        .image),
                                                    //fit: BoxFit.cover,
                                                    //width: double.infinity,
                                                  ))
                                              .toList(),
                                      options: CarouselOptions(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.7,
                                        viewportFraction: 1.0,
                                        enlargeCenterPage: false,
                                        initialPage: 0,
                                        enableInfiniteScroll: true,
                                        reverse: false,
                                        autoPlay: true,
                                        autoPlayInterval:
                                            const Duration(seconds: 3),
                                        autoPlayAnimationDuration:
                                            const Duration(seconds: 1),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: const Icon(
                                                Icons.arrow_back_ios_new,
                                                size: 22,
                                              ),
                                            ),
                                          ),
                                          FavoriteButtonInProductDetailScreen(productId: productId),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state
                                                .productsDetailsModel.data.name,
                                            style: const TextStyle(
                                              fontSize: 24,
                                              height: 1.4,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${state.productsDetailsModel.data.price}',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: defaultColor
                                                      .withOpacity(.7),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              if (state.productsDetailsModel
                                                      .data.discount !=
                                                  0)
                                                Text(
                                                  '${state.productsDetailsModel.data.old_price.round()}',
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.grey,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
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
                                      state.productsDetailsModel.data
                                          .description,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: ()
                                    {
                                      AddProductToCartCubit.get(context).addProductsToCart(
                                          productId:
                                          state.productsDetailsModel.data.id,context: context);
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(18),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Icon(
                                          CupertinoIcons.cart_fill,
                                          size: 22,
                                          color: defaultColor,
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 70,
                                      ),
                                      decoration: BoxDecoration(
                                        color: defaultColor,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Text(
                                        'Buy Now',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    //   Scaffold(
                    //   appBar: AppBar(
                    //     leading: IconButton(
                    //       onPressed: () {
                    //         Navigator.pop(context);
                    //       },
                    //       icon: const Icon(Icons.arrow_back),
                    //     ),
                    //     title:  const Text(
                    //       'Product Details',
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     centerTitle: true,
                    //   ),
                    //   body: SingleChildScrollView(
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(20.0),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             state.productsDetailsModel.data.name,
                    //             style: const TextStyle(
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.bold,
                    //               height: 1.4,
                    //             ),
                    //           ),
                    //           const SizedBox(
                    //             height: 24,
                    //           ),
                    //           CarouselSlider(
                    //             items: state.productsDetailsModel.data.images
                    //                 .map((e) => Image(
                    //                       image: NetworkImage(state
                    //                           .productsDetailsModel.data.image),
                    //                       //fit: BoxFit.cover,
                    //                       width: double.infinity,
                    //                     ))
                    //                 .toList(),
                    //             options: CarouselOptions(
                    //               height: 200,
                    //               viewportFraction: 1.0,
                    //               enlargeCenterPage: false,
                    //               initialPage: 0,
                    //               enableInfiniteScroll: true,
                    //               reverse: false,
                    //               autoPlay: true,
                    //               autoPlayInterval: const Duration(seconds: 3),
                    //               autoPlayAnimationDuration:
                    //                   const Duration(seconds: 1),
                    //               autoPlayCurve: Curves.fastOutSlowIn,
                    //               scrollDirection: Axis.horizontal,
                    //             ),
                    //           ),
                    //           const SizedBox(
                    //             height: 20,
                    //           ),
                    //           Row(
                    //             children: [
                    //               Text(
                    //                 '${state.productsDetailsModel.data.price.round()}',
                    //                 style: TextStyle(
                    //                   fontSize: 18.0,
                    //                   color: defaultColor,
                    //                 ),
                    //               ),
                    //               const SizedBox(
                    //                 width: 5.0,
                    //               ),
                    //               if (state.productsDetailsModel.data.discount != 0)
                    //                 Text(
                    //                   '${state.productsDetailsModel.data.old_price.round()}',
                    //                   style: const TextStyle(
                    //                     fontSize: 14.0,
                    //                     color: Colors.grey,
                    //                     decoration: TextDecoration.lineThrough,
                    //                   ),
                    //                 ),
                    //             ],
                    //           ),
                    //           const SizedBox(
                    //             height: 14,
                    //           ),
                    //           const Text(
                    //             'Description',
                    //             style: TextStyle(
                    //                 color: Colors.grey,
                    //                 fontSize: 18,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           const SizedBox(
                    //             height: 10,
                    //           ),
                    //           Text(
                    //             state.productsDetailsModel.data.description,
                    //             style: const TextStyle(
                    //               color: Colors.black,
                    //               fontSize: 12,
                    //               height: 1.3,
                    //             ),
                    //           ),
                    //           const SizedBox(
                    //             height: 30,
                    //           ),
                    //           Container(
                    //             color: defaultColor,
                    //             width: double.infinity,
                    //             child: TextButton(
                    //               onPressed: () {
                    //                 CartCubit.get(context).addDeleteCart(
                    //                     productId:
                    //                         state.productsDetailsModel.data.id);
                    //               },
                    //               child: Text(
                    //                 state.productsDetailsModel.data.in_cart
                    //                     ? 'REMOVE FROM CART'
                    //                     : 'ADD TO CART',
                    //                 style: const TextStyle(
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 18,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );
                  }
                  if (state is LoadingProductsDetailsState) {
                    return Container(
                        color: Colors.white,
                        child:
                            const Center(child: CircularProgressIndicator()));
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
          );
        },
      ),
    );
  }
}

