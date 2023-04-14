import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_application/carts_feature/controller/get_cart_cubit/get_carts_cubit.dart';
import 'package:shop_application/carts_feature/controller/get_cart_cubit/get_carts_states.dart';
import 'package:shop_application/carts_feature/presentation/pages/cart_screen.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/shop_layout_feature/controller/shop_layout_cubit/shop_layout_cubit.dart';
import 'package:shop_application/shop_layout_feature/controller/shop_layout_cubit/shop_layout_states.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLayoutCubit(),
      child: BlocConsumer<ShopLayoutCubit, ShopLayoutStates>(
        listener: (context, state) {
          if (state is ChangeBottomState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          }
        },
        builder: (context, state) {
          var cubit = ShopLayoutCubit.get(context);
          return Scaffold(
            appBar: buildAppBar(),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -10),
                    blurRadius: 35,
                    color: defaultColor.withOpacity(.38),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (int index) {
                  cubit.changeBottomNavigationBar(index);
                },
                items: [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.apps), label: 'Category'),
                  BottomNavigationBarItem(
                    icon: Stack(
                      children: [
                        const Icon(Icons.shopping_cart),
                        Positioned(
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: BlocBuilder<GetCartsCubit, GetCartsStates>(
                              builder: (context, state) {
                                if(state is SuccessGetCartsState) {
                                  return Text(
                                    '${state.cartsModel.data.cart_items.length}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                    ),
                                    textAlign: TextAlign.center,
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    label: 'Cart',
                  ),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favorite'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Setting'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: defaultColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'icons/menu.svg',
          color: defaultColor.withOpacity(.5),
        ),
        onPressed: () {},
      ),
    );
  }
}
