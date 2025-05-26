
import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';

class FavouriteIconWidet extends StatefulWidget {
  const FavouriteIconWidet({super.key});

  @override
  State<FavouriteIconWidet> createState() => _FavouriteIconWidetState();
}

class _FavouriteIconWidetState extends State<FavouriteIconWidet> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        isFavorite = !isFavorite;
        setState(() {});
      },
      icon:
          isFavorite
              ? Icon(Icons.favorite, size: 35, color: AppColors().orange)
              : Icon(
                Icons.favorite_border,
                size: 35,
                color: AppColors().orange,
              ),
    );
  }
}
