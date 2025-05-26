import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/core/widgets/custom_search_text_form_field.dart';
import 'package:store/features/categories/presentation/manager/cubit/category_cubit.dart';
import 'package:store/features/categories/presentation/manager/cubit/category_state.dart';
import 'package:store/features/categories/presentation/views/widgets/grid_of_product_info_cart_widget.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryCubit = BlocProvider.of<CategoryCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),

      child: BlocBuilder<CategoryCubit, CategoryState>(
        bloc: categoryCubit,
        buildWhen:
            (previous, current) =>
                current is CategoryLoading ||
                current is CategorySuccess ||
                current is CategoryFailed,
        builder: (context, state) {
          if (state is CategoryLoading) {
            return CustomLoadingIndecator();
          } else if (state is CategoryFailed) {
            return Text(state.error);
          } else if (state is CategorySuccess) {
            final products = state.products;
            return Column(
              children: [
                CustomSearchTextFormFieldWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: GridOfProductInfoCartWidget(products: products),
                ),
              ],
            );
          } else {
            return CustomLoadingIndecator();
          }
        },
      ),
    );
  }
}
