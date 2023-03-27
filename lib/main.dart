import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/auth_feature/presentation/pages/login_screen.dart';
import 'package:shop_application/core/network/local/cache_helper.dart';
import 'package:shop_application/core/network/remote/dio_helper.dart';
import 'package:shop_application/core/themes.dart';
import 'package:shop_application/favorites_feature/controller/get_favorite_cubt/favorite_cubt.dart';
import 'package:shop_application/on_boarding_screen/on_boarding_screen.dart';
import 'package:shop_application/products_feature/controller/products_cubit/product_cubit.dart';
import 'package:shop_application/shop_layout_feature/presentation/pages/shop_layout.dart';
import 'carts_feature/controller/cart_cubit/cart_cubit.dart';
import 'core/bloc_observer.dart';
import 'core/utiles/contants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print('uid $token');
  Widget widget;

  if (onBoarding != null) {
    if (token != null) {
      widget = const ShopLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }
  runApp(MyApp(
    firstWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget firstWidget;

  MyApp({super.key, required this.firstWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit()
            ..getDataProducts()
            ..getCategories(),
        ),
        BlocProvider(create: (context) => FavoriteCubit()..getFavorites()),
        BlocProvider(create: (context)=>CartCubit()..getCarts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: lightTheme,
        home: firstWidget,
      ),
    );
  }
}
