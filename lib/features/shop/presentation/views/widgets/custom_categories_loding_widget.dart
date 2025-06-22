import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCategoriesLoadingWidget extends StatelessWidget {
  const CustomCategoriesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: 5,
        itemBuilder:
            (context, index) => Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 247, 184, 106),
              highlightColor: const Color(0xFFFFE0C0),
              child: const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFFFFF0E0),
              ),
            ),
      ),
    );
  }
}
