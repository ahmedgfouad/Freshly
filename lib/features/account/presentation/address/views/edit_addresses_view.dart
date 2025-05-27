import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/presentation/address/views/widgets/edit_addresses_view_body.dart';

class EditAddressesView extends StatelessWidget {
  const EditAddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Edit Addresses", context: context),
      body: EditAddressesViewBody(),
    );
  }
}
