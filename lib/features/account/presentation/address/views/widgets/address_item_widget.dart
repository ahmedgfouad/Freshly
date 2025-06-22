import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/router/app_router.dart';
import 'package:store/core/thems/colors.dart';
import 'package:store/core/thems/styles.dart';
import 'package:store/features/account/data/models/address_model.dart';

class AddressItemWidget extends StatelessWidget {
  const AddressItemWidget({super.key, required this.address});
  final AddressModel address;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.appColors.offWhite,
      child: InkWell(
        onTap: () {
          GoRouter.of(
            context,
          ).push(AppRouter.kEditAddressesView, extra: address);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: context.appColors.browen,
                size: 30,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.city,
                      style: AppStyles.textStyle18(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      address.streetName,
                      style: AppStyles.textStyle14(context),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      "${address.phoneNumber}   ${address.nearestLandmark} ",
                      style: AppStyles.textStyle14(context),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),

              Icon(Icons.edit_location_alt, color: context.appColors.browen),
            ],
          ),
        ),
      ),
    );
  }
}
