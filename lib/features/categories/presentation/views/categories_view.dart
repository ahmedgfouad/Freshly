import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/categories/presentation/manager/cubit/category_cubit.dart';
import 'package:store/features/categories/presentation/views/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Products", context: context),
      body: BlocProvider(
        create: (context) {
          final cubit = CategoryCubit();
          cubit.getCategoryProducts(categoryName: categoryName);
          return cubit;
        },
        child: CategoriesViewBody(),
      ),
    );
  }
}
