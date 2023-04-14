import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/categories_feature/controller/category_cubit/category_cubit.dart';
import 'package:shop_application/categories_feature/controller/category_cubit/category_state.dart';
import 'package:shop_application/categories_feature/remote_data_source/categories_model/categories_model.dart';
import 'package:shop_application/category_details_feature/prsentation/pages/category_details_screen.dart';

class CategoriesScreen extends StatelessWidget
{
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<CategoryCubit, CategoryStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ListView.separated(
          itemBuilder: (context, index) => buildCatItem(
              CategoryCubit.get(context).categoriesModel!.data.data[index], context),
          separatorBuilder: (context, index) => Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],
          ),
          itemCount: CategoryCubit.get(context).categoriesModel!.data.data.length,
        );
      },
    );
  }

  Widget buildCatItem(DataModel model , BuildContext context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryDetailsScreen(categoryID:model.id,)));
      },
      child: Row(
        children:
        [
          Image(
            image: NetworkImage(model.image),
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            model.name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    ),
  );
}