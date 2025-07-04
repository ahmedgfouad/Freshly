import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:store/core/theme/colors.dart';

class CarouselSliderWidget extends StatelessWidget {
  CarouselSliderWidget({super.key});

  final List<String> imageList = [
    "https://th.bing.com/th/id/R.4c450901708575f1e34df0f016e43b72?rik=C23gCLfca9Saag&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/R.6f9ec27c18b5460d7748e132d4c898c6?rik=xzHXJbO88rQrhg&pid=ImgRaw&r=0",
    "https://www.pngall.com/wp-content/uploads/2016/03/Fruit-Free-Download-PNG.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height / 5,
          autoPlay: true,
          autoPlayInterval:const Duration(seconds: 4),
          enlargeCenterPage: false,
          viewportFraction: 0.9,
          enableInfiniteScroll: true,
          pauseAutoPlayOnTouch: true,
        ),
        items:
            imageList
                .map(
                  (item) => Container(
                    margin:const EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: item,
                        placeholder:
                            (context, url) => Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              color: context.appColors.offWhite,
                            ),
                        errorWidget:
                            (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
