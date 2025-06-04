 // ignore_for_file: file_names 
import 'package:flutter/material.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/account/presentation/address/views/widgets/new_addresses_use_google_map_body.dart';

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
              leading: Icon(Icons.edit_location_alt, color: AppColors().orange),
              title: Text(
                "Manual Address",
                style: AppStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                navigateTo(AppRouter.kManualNewAddressesView, context);
              },
            ),
            ListTile(
              leading: Icon(Icons.map, color: AppColors().orange),
              title: Text(
                'Select Address from Map',
                style: AppStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewAddressesUseGoogleMapBody(),
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
