import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/home_feature/controller/change_favorte_cubit/change_favorte_cubit.dart';
import 'package:shop_application/home_feature/controller/change_favorte_cubit/change_favorte_states.dart';
import 'package:shop_application/search_feature/remote_data_source/search_model/search_model.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key, required this.data,
  });
 final SearchData data;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeFavoriteCubit, ChangeFavoriteStates>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            ChangeFavoriteCubit.get(context)
                .changeFavorite(productId: data.id, context: context);
          },
          icon: CircleAvatar(
            radius: 15.0,
            backgroundColor: favorites[data.id]!
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
