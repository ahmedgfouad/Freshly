import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/presentation/address/manager/manual_new_address_cubit/manual_new_address_cubit.dart';
import 'package:store/features/account/presentation/address/views/widgets/manual_new_address_view_body.dart';

class ManualNewAddressesView extends StatelessWidget {
  const ManualNewAddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "New Address", context: context),
      body: BlocProvider(
        create: (context) => ManualNewAddressCubit(),
        child: ManualNewAddressViewBody(),
      ),
    );
  }
}
