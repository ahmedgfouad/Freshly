import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/account/presentation/address/manager/edit_address_cubit/edit_address_cubit.dart';
import 'package:store/features/account/presentation/address/views/widgets/edit_addresses_view_body.dart';

class EditAddressesView extends StatelessWidget {
  const EditAddressesView({super.key, required this.address});
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Edit Addresses", context: context),
      body: BlocProvider(
        create: (context) => EditAddressCubit(),
        child: EditAddressesViewBody(address: address),
      ),
    );
  }
}
