import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/home_feature/controller/change_favorte_cubit/change_favorte_cubit.dart';
import 'package:shop_application/home_feature/controller/change_favorte_cubit/change_favorte_states.dart';
import '../../../core/utiles/contants.dart';
import 'package:shop_application/favorites_feature/remote_data_source/model/favorites.dart';

class FavoriteButtonInFavoritesScreen extends StatelessWidget {
  const FavoriteButtonInFavoritesScreen({
    super.key, required this.model,
  });

  final Data model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeFavoriteCubit, ChangeFavoriteStates>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            ChangeFavoriteCubit.get(context)
                .changeFavorite(
                productId: model.product.id, context: context);
          },
          icon: CircleAvatar(
            radius: 15.0,
            backgroundColor:
                favorites[model.product.id] !=
                null
                ? defaultColor
                : Colors.grey,
            child: const Icon(
              Icons.favorite_border,
              size: 14.0,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
