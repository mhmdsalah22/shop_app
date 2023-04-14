import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/carts_feature/controller/delete_cart_cubit/delete_cart_cubit.dart';
import 'package:shop_application/carts_feature/controller/delete_cart_cubit/delete_cart_states.dart';
import 'package:shop_application/carts_feature/remote_data_source/model/get_carts_model.dart';
import '../../../core/utiles/contants.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.cartItem,
  });

  final Cart_items cartItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteCartCubit, DeleteCartStates>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            DeleteCartCubit.get(context)
                .deleteCart(cartId: cartItem.id ,context: context);
          },
          icon: Icon(
            Icons.delete,
            color: defaultColor,
          ),
        );
      },
    );
  }
}
