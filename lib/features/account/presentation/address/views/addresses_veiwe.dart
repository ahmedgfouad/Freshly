import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/presentation/address/manager/addresses_cubit/addresses_cubit.dart';
import 'package:store/features/account/presentation/address/views/widgets/addresses_view_body.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Addresses", context: context),
      body: BlocProvider(
        create: (context) => AddressesCubit(),
        child: AddressesViewBody(),
      ),
    );
  }
}
