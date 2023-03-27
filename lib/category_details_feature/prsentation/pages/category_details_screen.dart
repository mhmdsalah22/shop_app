import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_application/category_details_feature/controller/category_details_cubit/category_details_cubit.dart';
import 'package:shop_application/category_details_feature/controller/category_details_cubit/category_details_states.dart';
import 'package:shop_application/category_details_feature/data_source/model/category_detail_model.dart';
import 'package:shop_application/core/utiles/contants.dart';
import 'package:shop_application/products_details_feture/presentation/pages/products_detailes.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({Key? key, required this.categoryID}) : super(key: key);
  final int categoryID;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryDetailCubit()..getCategoryDetails(categoryID: categoryID),
      child: BlocBuilder<CategoryDetailCubit, CategoryDetailsStates>(
        builder: (context, state) {
          if (state is LoadingCategoryDetailsState) {
            return Container(
                color: Colors.white,
                child: const Center(child: CircularProgressIndicator()));
          }
          if (state is ErrorCategoryDetailsState) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state is SuccessCategoryDetailsState) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                title: const Text(
                 'Category Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
              body: ListView.separated(
                  itemBuilder: (context, index) => BuildCategoryDetail(
                      dataModel: state.categoryDetailModel.data.data[index]),
                  separatorBuilder: (context, index) => Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                  itemCount: state.categoryDetailModel.data.data.length),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class BuildCategoryDetail extends StatelessWidget {
  const BuildCategoryDetail({
    super.key,
    required this.dataModel,
  });

  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductsDetailsScreen(
                      productId: dataModel.id,
                    )));
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
                    image: NetworkImage(dataModel.image),
                    width: 120.0,
                    height: 120.0,
                  ),
                  if (dataModel.discount != 0)
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
                      dataModel.name,
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
                          '${dataModel.price}',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: defaultColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        if (dataModel.discount != 0)
                          Text(
                            '${dataModel.old_price}',
                            style: const TextStyle(
                                fontSize: 10.0,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
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
