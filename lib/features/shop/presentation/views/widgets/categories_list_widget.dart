import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/images.dart';

class CategoriesListWidget extends StatelessWidget {
  CategoriesListWidget({super.key});

  final List<String> categoriesList = [
    AppImages.fruitsImg,
    AppImages.vegtablesImg,

    AppImages.fishImg,
    AppImages.meatImg,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => SvgPicture.asset(categoriesList[index]),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: categoriesList.length,
      ),
    );
  }
}
