import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomPopularLoadingWidget extends StatelessWidget {
  const CustomPopularLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: 3,
        itemBuilder:
            (context, index) => Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 247, 184, 106),
              highlightColor: const Color(0xFFFFE0C0),
              direction: ShimmerDirection.ltr,
              period: const Duration(milliseconds: 1500),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.3,
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFFFE0C0),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 100,
                      height: 10,
                      color: const Color(0xFFFFE0C0),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 80,
                      height: 10,
                      color: const Color(0xFFFFE0C0),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 10,
                          color: const Color(0xFFFFE0C0),
                        ),
                        const CircleAvatar(
                          radius: 15,
                          backgroundColor: Color(0xFFFFE0C0),
                        ),
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
