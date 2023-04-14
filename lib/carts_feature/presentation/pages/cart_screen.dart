import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_application/carts_feature/controller/get_cart_cubit/get_carts_cubit.dart';
import 'package:shop_application/carts_feature/controller/get_cart_cubit/get_carts_states.dart';
import 'package:shop_application/carts_feature/presentation/widget/cart_item_samples.dart';
import 'package:shop_application/carts_feature/remote_data_source/model/get_carts_model.dart';
import 'package:shop_application/core/utiles/contants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartsCubit, GetCartsStates>(
      builder: (context, state) {
        if (state is LoadingGetCartsState) {
          return Scaffold(
              appBar: AppBar(),
              body: const Center(child: CircularProgressIndicator()));
        }
        if (state is ErrorGetCartsState) {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if (state is SuccessGetCartsState) {
          double totalPrice = 0;
          for(int i =0; i < state.cartsModel.data.cart_items.length ; i++){
            totalPrice += state.cartsModel.data.cart_items[i].product.price * state.cartsModel.data.cart_items[i].quantity;
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              title: const Text(
                'Cart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              titleSpacing: 12,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => BuildCartItem(
                      state.cartsModel.data.cart_items[index],
                    ),
                    separatorBuilder: (context, index) => Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                    itemCount: state.cartsModel.data.cart_items.length,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       const Text(
                  //         'Select All',
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //       Checkbox(
                  //         activeColor: defaultColor,
                  //         value: true,
                  //         onChanged: (value) {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Payment',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '$totalPrice',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: defaultColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 90,
                      ),
                      decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class BuildCartItem extends StatelessWidget {
  const BuildCartItem(
    this.cartItem, {
    super.key,
  });

  final Cart_items cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          CartItemSamples(
            cartItem: cartItem,
          ),
        ],
      ),
    );
  }
}
