
import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class MapLocationWidget extends StatelessWidget {
  const MapLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors().ofWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 25.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.map_outlined, color: AppColors().browen),
            Text(
              "Current Map Location",
              style: AppStyles.textStyle18.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.edit_location_alt,
              color: AppColors().browen,
            ),
          ],
        ),
      ),
    );
  }
}
