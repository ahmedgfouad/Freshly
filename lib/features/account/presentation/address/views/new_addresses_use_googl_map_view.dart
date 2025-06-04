import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/presentation/address/manager/location_cubit/location_cubit.dart';
import 'package:store/features/account/presentation/address/views/widgets/new_addresses_use_google_map_body.dart';

class NewAddressesUseGooglMapView extends StatelessWidget {
  const NewAddressesUseGooglMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "New Address", context: context),
      body: BlocProvider(
        create: (context) {
          final cubit = LocationCubit();
          cubit.initLocation();
          return cubit; 
        },
        child: NewAddressesUseGoogleMapBody(),
      ),
    );
  }
}
