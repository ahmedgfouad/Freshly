import 'package:flutter/material.dart';
import 'package:store/core/thems/colors.dart';
import 'package:store/core/thems/styles.dart';

class MapLocationWidget extends StatelessWidget {
  const MapLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.appColors.offWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.map_outlined, color: context.appColors.browen),
            Text(
              "Current Map Location",
              style: AppStyles.textStyle18(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            Icon(Icons.edit_location_alt, color: context.appColors.browen),
          ],
        ),
      ),
    );
  }
}
