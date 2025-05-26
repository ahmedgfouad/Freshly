import 'package:flutter/material.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/features/account/presentation/address/widgets/address_item_widget.dart';

class AddressesViewBody extends StatelessWidget {
  const AddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AddressItemWidget(
              title: 'Homwe',
              subTitle: 'Lungangen 6, 41722',
              icon: Icons.home,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: AddressItemWidget(
              title: 'Office',
              subTitle: 'Lungangen 6, 41722',
              icon: Icons.shopping_bag,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButon(
                text: "Add New Address",
                onPressed: () {
                  navigateTo(AppRouter.kNewAddressesView, context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
