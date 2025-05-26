import 'package:flutter/material.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/features/account/presentation/widget/account_option_widget.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 30),
      child: Column(
        children: [
          AccountOptionWidget(
            icon: Icons.person,
            title: "Profile",
            onPressed: () {
              navigateTo(AppRouter.kProfileView, context);
            },
          ),
          SizedBox(height: 30),
          AccountOptionWidget(
            icon: Icons.shopping_basket_outlined,
            title: "Orders",
            onPressed: () {
              navigateTo(AppRouter.kOrderssView, context);
            },
          ),
          SizedBox(height: 30),
          AccountOptionWidget(
            icon: Icons.location_on,
            title: "Address",
            onPressed: () {
              navigateTo(AppRouter.kAddressesView, context);
            },
          ),
          SizedBox(height: 30),
          AccountOptionWidget(
            icon: Icons.payment,
            title: "Payment",
            onPressed: () {},
          ),
          SizedBox(height: 30),
          
        ],
      ),
    );
  }
}
