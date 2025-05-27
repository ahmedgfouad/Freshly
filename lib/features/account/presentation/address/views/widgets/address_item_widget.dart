import 'package:flutter/material.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/core/utils/styles.dart';

class AddressItemWidget extends StatefulWidget {
  const AddressItemWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final String title, subTitle;
  final IconData? icon;

  @override
  State<AddressItemWidget> createState() => _AddressItemWidgetState();
}

class _AddressItemWidgetState extends State<AddressItemWidget> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: isTap ? 8 : 0,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          isTap = !isTap;
          setState(() {});
          navigateTo(AppRouter.kEditAddressesView, context);
        },
        child: Row(
          children: [
            Icon(widget.icon, color: AppColors().browen, size: 30),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppStyles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.subTitle, style: AppStyles.textStyle14),
              ],
            ),
            Spacer(),
            Icon(Icons.edit_location_alt, color: AppColors().browen),
          ],
        ),
      ),
    );
  }
}
