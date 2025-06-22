import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/constants.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/account/presentation/address/manager/manual_new_address_cubit/manual_new_address_cubit.dart';
import 'package:store/features/account/presentation/address/manager/manual_new_address_cubit/manual_new_address_state.dart';
import 'package:store/generated/l10n.dart';

class ManualNewAddressViewBody extends StatefulWidget {
  const ManualNewAddressViewBody({super.key});

  @override
  State<ManualNewAddressViewBody> createState() =>
      _ManualNewAddressViewBodyState();
}

class _ManualNewAddressViewBodyState extends State<ManualNewAddressViewBody> {
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
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final newaddressCubit = BlocProvider.of<ManualNewAddressCubit>(context);
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomTextFormFieldWidget(
                    hintText: S.of(context).GovernorateCity,
                    controller: cityController,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormFieldWidget(
                    hintText: S.of(context).StreetName,
                    controller: streetNameController,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormFieldWidget(
                    hintText: S.of(context).BuildingFloorApartment,
                    controller: buildingNumberController,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormFieldWidget(
                    hintText: S.of(context).NearestLandmark,
                    controller: nearestLandmarkController,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormFieldWidget(
                    keyboardType: TextInputType.phone,
                    hintText: S.of(context).PhoneNumber,
                    controller: phoneNumberController,
                  ),
                ],
              ),
            ),

            BlocConsumer<ManualNewAddressCubit, ManualNewAddressState>(
              bloc: newaddressCubit,
              listenWhen:
                  (previous, current) =>
                      current is ManualNewAddressSuccessState,
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).Successfuly),
                    duration: Duration(milliseconds: 700),
                    backgroundColor: context.appColors.browen,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
                Navigator.of(context).pop();
              },
              buildWhen:
                  (previous, current) =>
                      current is ManualNewAddressInitial ||
                      current is ManualNewAddressLoadingState ||
                      current is ManualNewAddressSuccessState ||
                      current is ManualNewAddressFailedState,
              builder: (context, state) {
                if (state is ManualNewAddressLoadingState) {
                  return SliverToBoxAdapter(child: CustomLoadingIndecator());
                } else if (state is ManualNewAddressFailedState) {
                  return SliverToBoxAdapter(child: Text(state.error));
                } else if (state is ManualNewAddressSuccessState ||
                    state is ManualNewAddressInitial) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButon(
                        text: S.of(context).AddNewAddress,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await newaddressCubit.addNewAddress(
                              AddressModel(
                                id: documentIdFromLocalData(),
                                city: cityController.text,
                                streetName: streetNameController.text,
                                buildinNumber: buildingNumberController.text,
                                nearestLandmark: nearestLandmarkController.text,
                                phoneNumber: phoneNumberController.text,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(child: Text("error"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
