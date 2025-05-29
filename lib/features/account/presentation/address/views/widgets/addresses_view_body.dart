import 'package:flutter/material.dart';

import 'package:store/core/utils/app_router.dart';

import 'package:store/core/utils/navigator.dart';

import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/features/account/presentation/address/views/widgets/addresses_section_widget.dart';

class AddressesViewBody extends StatelessWidget {
  const AddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: AddressesSectionWidget()),
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
