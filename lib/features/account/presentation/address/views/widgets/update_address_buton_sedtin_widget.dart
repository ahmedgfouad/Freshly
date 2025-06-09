import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/account/presentation/address/manager/edit_address_cubit/edit_address_cubit.dart';
import 'package:store/features/account/presentation/address/manager/edit_address_cubit/edit_address_state.dart';
import 'package:store/generated/l10n.dart';

class UpdateAddressButonSectionWiget extends StatelessWidget {
  const UpdateAddressButonSectionWiget({
    super.key,
    required this.formKey,
    required this.id,
    required this.cityController,
    required this.streetNameController,
    required this.buildingNumberController,
    required this.nearestLandmarkController,
    required this.phoneNumberController,
  });

  final GlobalKey<FormState> formKey;
  final String id;
  final TextEditingController cityController;
  final TextEditingController streetNameController;
  final TextEditingController buildingNumberController;
  final TextEditingController nearestLandmarkController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    final editaddressCubit = BlocProvider.of<EditAddressCubit>(context);
    return BlocConsumer<EditAddressCubit, EditAddressState>(
      bloc: editaddressCubit,
      listenWhen: (previous, current) => current is EditAddressSuccessState,
      listener: (context, state) {
        Navigator.of(context).pop();
      },
      buildWhen:
          (previous, current) =>
              current is EditAddressInitial ||
              current is EditAddressLoadingState ||
              current is EditAddressSuccessState ||
              current is EditAddressFailedState,
      builder: (context, state) {
        if (state is EditAddressLoadingState) {
          return CustomLoadingIndecator();
        } else if (state is EditAddressFailedState) {
          return Text(state.error);
        } else if (state is EditAddressInitial ||
            state is EditAddressSuccessState) {
          return CustomButon(
            text: S.of(context).UpdateAddress,
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await editaddressCubit.editAddress(
                  AddressModel(
                    id: id,
                    city: cityController.text,
                    streetName: streetNameController.text,
                    buildinNumber: buildingNumberController.text,
                    nearestLandmark: nearestLandmarkController.text,
                    phoneNumber: phoneNumberController.text,
                  ),
                );
              }
            },
          );
        } else {
          return CustomLoadingIndecator();
        }
      },
    );
  }
}
