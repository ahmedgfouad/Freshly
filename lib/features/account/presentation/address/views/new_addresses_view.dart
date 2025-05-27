import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/presentation/address/manager/new_address_cubit/new_address_cubit.dart';
import 'package:store/features/account/presentation/address/views/widgets/new_address_view_body.dart';

class NewAddressesView extends StatelessWidget {
  const NewAddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "New Address", context: context),
      body: BlocProvider(
        create: (context) => NewAddressCubit(),
        child: NewAddressViewBody(),
      ),
    );
  }
}
