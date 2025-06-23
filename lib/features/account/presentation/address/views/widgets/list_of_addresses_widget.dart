import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theme/colors.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/account/presentation/address/manager/addresses_cubit/addresses_cubit.dart';
import 'package:store/features/account/presentation/address/manager/addresses_cubit/addresses_state.dart';
import 'package:store/features/account/presentation/address/views/widgets/address_item_widget.dart';

class ListOfAddressesWidget extends StatelessWidget {
  const ListOfAddressesWidget({super.key, required this.addresses});

  final List<AddressModel> addresses;

  @override
  Widget build(BuildContext context) {
    final addressCubit = BlocProvider.of<AddressesCubit>(context);
    return BlocBuilder<AddressesCubit, AddressesState>(
      bloc: addressCubit,
      buildWhen:
          (previous, current) =>
              current is SuccsessDeleteAddressState ||
              current is LoadingDeleteAddressState ||
              current is FailedDeleteAddressState,
      builder: (context, state) {
        if (state is LoadingDeleteAddressState) {
          return CustomLoadingIndecator();
        } else if (state is FailedDeleteAddressState) {
          return Text(state.error);
        } else if (state is SuccsessDeleteAddressState ||
            state is AddressesSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: ListView.separated(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index];
                return Dismissible(
                  onDismissed: (v) {
                    addressCubit.deleteAddress(address);
                  },
                  key: ValueKey(address),
                  background: Container(
                    decoration: BoxDecoration(
                      color: context.appColors.browen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.delete_outline,
                      color: context.appColors.white,
                    ),
                  ),
                  child: AddressItemWidget(address: address),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
            ),
          );
        } else {
          return CustomLoadingIndecator();
        }
      },
    );
  }
}
