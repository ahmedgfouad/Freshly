import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/account/presentation/address/manager/addresses_cubit/addresses_cubit.dart';
import 'package:store/features/account/presentation/address/manager/location_view_cubit/location_view_cubit.dart';
import 'package:store/features/account/presentation/address/manager/location_view_cubit/location_view_state.dart';
import 'package:store/features/account/presentation/address/views/widgets/addresses_section_widget.dart';
import 'package:store/features/account/presentation/address/views/widgets/map_location_widget.dart';
import 'package:store/features/account/presentation/address/views/widgets/show_Address_options_widget.dart';

class AddressesViewBody extends StatelessWidget {
  const AddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          BlocBuilder<LocationViewCubit, LocationViewState>( 
            bloc: BlocProvider.of<LocationViewCubit>(context),
            builder: (context, state) {
              if (state is LocationViewLoading) {
                return const CustomLoadingIndecator();
              } else if (state is LocationViewLoaded) {
                return MapLocationWidget();
              } else if (state is LocationViewEmpty) {
                return const SizedBox();
              } else if (state is LocationViewError) {
                return Text("Error: ${state.message}");
              }
              return const SizedBox();
            },
          ),
           Expanded(
            child: BlocProvider(
              create: (context) => AddressesCubit(),
              child: AddressesSectionWidget(),
            ),
          ),
          CustomButon(
            text: "Add New Address",
            onPressed: () {
              showAddressOptionsWidget(context);
            },
          ),
        ],
      ),
    );
  }
}
