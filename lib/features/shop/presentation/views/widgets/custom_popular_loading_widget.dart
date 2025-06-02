
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/colors.dart';

class CustomPopularLoadingWidget extends StatelessWidget {
  const CustomPopularLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 3,
        itemBuilder:
            (context, index) => Shimmer.fromColors(
              baseColor: AppColors().orange,
              highlightColor: AppColors().browen,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.3,
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 30),
                    SizedBox(height: 20),
                    Container(width: 100, height: 10, color: Colors.grey),
                    SizedBox(height: 20),
                    Container(width: 80, height: 10, color: Colors.grey),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 50, height: 10, color: Colors.grey),
                        CircleAvatar(radius: 15, backgroundColor: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
