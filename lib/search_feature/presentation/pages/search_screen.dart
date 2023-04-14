import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/home_feature/controller/products_cubit/product_cubit.dart';
import 'package:shop_application/home_feature/controller/products_cubit/product_states.dart';
import 'package:shop_application/search_feature/controller/search_cubit/search_cubit.dart';
import 'package:shop_application/search_feature/controller/search_cubit/search_states.dart';
import 'package:shop_application/search_feature/presentation/widget/favorite_button.dart';
import 'package:shop_application/search_feature/remote_data_source/search_model/search_model.dart';
import '../../../core/utiles/contants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter text to search';
                        }
                        return null;
                      },
                      onFieldSubmitted: (String text) {
                        SearchCubit.get(context).searchProduct(text: text);
                      },
                      decoration: const InputDecoration(
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is LoadingSearchState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is SuccessSearchState)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              buildProductsSearchItem(
                                  state.searchModel.data.data[index], context),
                          separatorBuilder: (context, index) =>
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.grey[300],
                              ),
                          itemCount:
                          state.searchModel.data.data.length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


Widget buildProductsSearchItem(SearchData data, BuildContext context) {
  return BlocBuilder<ProductsCubit, ProductsStates>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 120.0,
          child: Row(
            children: [
              Image(
                image: NetworkImage(
                  data.image,
                ),
                width: 120.0,
                height: 120.0,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
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
                          '${data.price}',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: defaultColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Spacer(),
                         FavoriteButton(data: data,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

