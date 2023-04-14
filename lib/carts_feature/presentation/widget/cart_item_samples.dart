import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/carts_feature/controller/update_carts_cubit/update_carts_cubit.dart';
import 'package:shop_application/carts_feature/controller/update_carts_cubit/update_carts_states.dart';
import 'package:shop_application/carts_feature/presentation/widget/delete_button.dart';
import 'package:shop_application/carts_feature/remote_data_source/model/get_carts_model.dart';
import 'package:shop_application/core/utiles/contants.dart';

class CartItemSamples extends StatelessWidget {
  const CartItemSamples({Key? key, required this.cartItem}) : super(key: key);
  final Cart_items cartItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCartsCubit, UpdateCartsStates>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  // Checkbox(
                  //     activeColor: defaultColor,
                  //     value: true,
                  //     onChanged: (value) {}),
                  Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(image: NetworkImage(cartItem.product.image)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              cartItem.product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.2,
                                color: Colors.black.withOpacity(.7),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            '${cartItem.product.price * cartItem.quantity}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: defaultColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DeleteButton(cartItem: cartItem),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                UpdateCartsCubit.get(context).minusProduct(
                                    cartId: cartItem.id, context: context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  CupertinoIcons.minus,
                                  size: 22,
                                  color: defaultColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${cartItem.quantity}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () {
                                UpdateCartsCubit.get(context).plusProduct(
                                    cartId: cartItem.id, context: context);
                                print('${cartItem.quantity}');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  CupertinoIcons.plus,
                                  size: 22,
                                  color: defaultColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

