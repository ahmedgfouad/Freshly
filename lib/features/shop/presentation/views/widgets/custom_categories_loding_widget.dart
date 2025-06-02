


import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/colors.dart';

class CustomCategoriesLoadingWidget extends StatelessWidget {
  const CustomCategoriesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 5,
        itemBuilder:
            (context, index) => Shimmer.fromColors(
              baseColor: AppColors().orange,
              highlightColor: AppColors().browen,
              child: CircleAvatar(radius: 40),
            ),
      ),
    );
  }
}
