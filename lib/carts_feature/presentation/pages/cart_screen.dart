import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_application/carts_feature/controller/cart_cubit/cart_cubit.dart';
import 'package:shop_application/carts_feature/controller/cart_cubit/cart_states.dart';
import 'package:shop_application/carts_feature/remote_data_source/model/get_carts_model.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/products_details_feture/presentation/pages/products_detailes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        if(state is LoadingGetCartsState)
        {
         return  const Center(child: CircularProgressIndicator());
        }
        if(state is ErrorGetCartsState)
        {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if(state is SuccessGetCartsState)
        {
          return ListView.separated(
              itemBuilder: (context , index)=>BuildCartItem(state.cartsModel.data.cart_items[index]),
              separatorBuilder: (context , index)=>Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              itemCount: state.cartsModel.data.cart_items.length,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class BuildCartItem extends StatelessWidget {
  const BuildCartItem(this.cartItem, {super.key});

    final Cart_items cartItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductsDetailsScreen(productId: cartItem.product.id,)));
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
                    image: NetworkImage(cartItem.product.image),
                    width: 120.0,
                    height: 120.0,
                  ),
                  if (cartItem.product.discount != 0 )
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
                      cartItem.product.name,
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
                          '${cartItem.product.price}',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: defaultColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        if (cartItem.product.discount != 0)
                          Text(
                            '${cartItem.product.old_price}',
                            style: const TextStyle(
                                fontSize: 10.0,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        // const Spacer(),
                        // IconButton(
                        //   onPressed: () {
                        //     print('hi');
                        //     ProductsCubit.get(context)
                        //         .changeFavorite(model.product.id, context);
                        //   },
                        //   icon: CircleAvatar(
                        //     radius: 15.0,
                        //     backgroundColor: ProductsCubit
                        //         .get(context)
                        //         .favorites[model.product.id] !=
                        //         null
                        //         ? defaultColor
                        //         : Colors.grey,
                        //     child: const Icon(
                        //       Icons.favorite_border,
                        //       size: 14.0,
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
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
}
