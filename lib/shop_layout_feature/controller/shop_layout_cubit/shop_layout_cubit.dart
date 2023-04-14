import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/auth_feature/presentation/pages/setting_screen.dart';
import 'package:shop_application/carts_feature/presentation/pages/cart_screen.dart';
import 'package:shop_application/categories_feature/presentation/pages/categories_screen.dart';
import 'package:shop_application/home_feature/presentation/pages/products_screen.dart';
import 'package:shop_application/shop_layout_feature/controller/shop_layout_cubit/shop_layout_states.dart';
import '../../../favorites_feature/presentation/pages/favorites_screen.dart';

class ShopLayoutCubit extends Cubit<ShopLayoutStates> {
  ShopLayoutCubit() : super(InitialShopLayoutState());

  static ShopLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
     const FavoritesScreen(),
    SettingScreen(),
  ];

  void changeBottomNavigationBar(int index) {
    if (index == 2) {
      emit(ChangeBottomState());
    }
    else {
      currentIndex = index;
      emit(ChangeBottomNavigationBarState());
    }
  }
}
