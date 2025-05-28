import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/account/presentation/address/manager/addresses_cubit/addresses_cubit.dart';
import 'package:store/features/account/presentation/address/manager/addresses_cubit/addresses_state.dart';
import 'package:store/features/account/presentation/address/views/widgets/list_of_addresses_widget.dart';

class AddressesViewBody extends StatelessWidget {
  const AddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final addressCubit = BlocProvider.of<AddressesCubit>(context);
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<AddressesCubit, AddressesState>(
              bloc: addressCubit,
              buildWhen:
                  (previous, current) =>
                      current is SuccsessDeleteAddressState ||
                      current is AddressesLoadingState ||
                      current is AddressesSuccessState ||
                      current is AddressesFailedState,
              builder: (context, state) { 
                if (state is AddressesLoadingState) {
                  return CustomLoadingIndecator();
                } else if (state is AddressesFailedState) {
                  return Text(state.error);
                } else if (state is AddressesSuccessState) {
                  final addresses = state.addresses;
                  return addresses.isNotEmpty
                      ? ListOfAddressesWidget(addresses: addresses)
                      : SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: Column(
                          children: [
                            SvgPicture.asset(AppImages.addressImg),
                            SizedBox(height: 20),
                            Text(
                              "No Addressed Added ",
                              style: AppStyles.textStyle24,
                            ),
                          ],
                        ),
                      );
                } else {
                  return Text("error");
                }
              },
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
