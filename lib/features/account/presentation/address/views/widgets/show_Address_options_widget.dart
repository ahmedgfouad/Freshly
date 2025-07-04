// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:store/core/router/app_router.dart';
import 'package:store/core/theme/colors.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/core/theme/styles.dart';

void showAddressOptionsWidget(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.edit_location_alt,
                color: context.appColors.orange,
              ),
              title: Text(
                "Manual Address",
                style: AppStyles.textStyle18(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                navigateTo(AppRouter.kManualNewAddressesView, context);
              },
            ),
            ListTile(
              leading: Icon(Icons.map, color: context.appColors.orange),
              title: Text(
                'Select Address from Map',
                style: AppStyles.textStyle18(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                navigateTo(AppRouter.kNewAddressesUseGoogleMapView, context);
              },
            ),
          ],
        ),
      );
    },
  );
}
