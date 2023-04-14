import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/home_feature/controller/change_favorte_cubit/change_favorte_cubit.dart';
import 'package:shop_application/home_feature/controller/change_favorte_cubit/change_favorte_states.dart';

class FavoriteButtonInProductDetailScreen extends StatelessWidget {
  const FavoriteButtonInProductDetailScreen({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeFavoriteCubit, ChangeFavoriteStates>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            ChangeFavoriteCubit.get(context).changeFavorite( productId: productId, context: context);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: favorites[productId]! ? defaultColor : Colors.grey[200],
              borderRadius:
              BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.favorite_border,
              size: 22,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
