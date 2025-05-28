import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/account/presentation/address/manager/edit_address_cubit/edit_address_cubit.dart';
import 'package:store/features/account/presentation/address/manager/edit_address_cubit/edit_address_state.dart';

class EditAddressesViewBody extends StatefulWidget {
  const EditAddressesViewBody({super.key, required this.address});

  final AddressModel address;

  @override
  State<EditAddressesViewBody> createState() => _EditAddressesViewBodyState();
}

class _EditAddressesViewBodyState extends State<EditAddressesViewBody> {
  final cityController = TextEditingController();
  final streetNameController = TextEditingController();
  final buildingNumberController = TextEditingController();
  final nearestLandmarkController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    streetNameController.dispose();
    buildingNumberController.dispose();
    nearestLandmarkController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    cityController.text = widget.address.city;
    streetNameController.text = widget.address.streetName;
    buildingNumberController.text = widget.address.buildinNumber;
    nearestLandmarkController.text = widget.address.nearestLandmark;
    phoneNumberController.text = widget.address.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    final editaddressCubit = BlocProvider.of<EditAddressCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomTextFormFieldWidget(
                  hintText: "Governorate / City",
                  controller: cityController,
                ),
                SizedBox(height: 20),
                CustomTextFormFieldWidget(
                  hintText: "Street Name",
                  controller: streetNameController,
                ),
                SizedBox(height: 20),
                CustomTextFormFieldWidget(
                  hintText: "Building Number / Floor / Apartment",
                  controller: buildingNumberController,
                ),
                SizedBox(height: 20),
                CustomTextFormFieldWidget(
                  hintText: "Nearest Landmark",
                  controller: nearestLandmarkController,
                ),
                SizedBox(height: 20),
                CustomTextFormFieldWidget(
                  keyboardType: TextInputType.phone,
                  hintText: "Phone Number",
                  controller: phoneNumberController,
                ),
              ],
            ),
          ),
          BlocConsumer<EditAddressCubit, EditAddressState>(
            bloc: editaddressCubit,
            listenWhen:
                (previous, current) => current is EditAddressSuccessState,
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
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButon(
                      text: "Update Address",
                      onPressed: () async {
                        await editaddressCubit.editAddress(
                          AddressModel(
                            id: widget.address.id,
                            city: cityController.text,
                            streetName: streetNameController.text,
                            buildinNumber: buildingNumberController.text,
                            nearestLandmark: nearestLandmarkController.text,
                            phoneNumber: phoneNumberController.text,
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return CustomLoadingIndecator();
              }
            },
          ),
        ],
      ),
    );
  }
}
