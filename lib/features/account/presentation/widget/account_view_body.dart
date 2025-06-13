import 'package:flutter/material.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/features/account/presentation/widget/account_option_widget.dart';
import 'package:store/generated/l10n.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
      child: Column(
        children: [
          AccountOptionWidget(
            icon: Icons.person,
            title: S.of(context).Profile,
            onPressed: () {
              navigateTo(AppRouter.kProfileView, context);
            },
          ),
          const SizedBox(height: 40),
          AccountOptionWidget(
            icon: Icons.shopping_basket_outlined,
            title: S.of(context).Orders,
            onPressed: () {
              navigateTo(AppRouter.kOrderssView, context);
            },
          ),
          const SizedBox(height: 40),
          AccountOptionWidget(
            icon: Icons.location_on,
            title: S.of(context).Addresses,
            onPressed: () {
              navigateTo(AppRouter.kAddressesView, context);
            },
          ),
          const SizedBox(height: 40),
          AccountOptionWidget(
            icon: Icons.payment,
            title: S.of(context).Payment,
            onPressed: () {},
          ),
          const SizedBox(height: 40),
        
        ],
      ),
    );
  }
}
