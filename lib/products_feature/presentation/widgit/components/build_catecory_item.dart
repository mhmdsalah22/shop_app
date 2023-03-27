import 'package:flutter/material.dart';
import 'package:shop_application/categories_feature/remote_data_source/categories_model/categories_model.dart';
import 'package:shop_application/category_details_feature/prsentation/pages/category_details_screen.dart';


class BuildCategoryItem extends StatelessWidget{
   const BuildCategoryItem({super.key, required this.model});
 final DataModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryDetailsScreen(categoryID : model.id,)));
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(model.image),
            height: 120.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(
              .8,
            ),
            width: 100.0,
            child: Text(
              model.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}