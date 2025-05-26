import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/presentation/address/widgets/new_address_view_body.dart';

class NewAddressesView extends StatelessWidget {
  const NewAddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "New Address", context: context),
      body: NewAddressViewBody(),
    );
  }
}
