import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/constants.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/account/presentation/address/manager/new_address_cubit/new_address_cubit.dart';
import 'package:store/features/account/presentation/address/manager/new_address_cubit/new_address_state.dart';

class NewAddressViewBody extends StatefulWidget {
  const NewAddressViewBody({super.key});

  @override
  State<NewAddressViewBody> createState() => _NewAddressViewBodyState();
}

class _NewAddressViewBodyState extends State<NewAddressViewBody> {
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

    final newaddressCubit = BlocProvider.of<NewAddressCubit>(context);
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

            BlocConsumer<NewAddressCubit, NewAddressState>(
              bloc: newaddressCubit,
              listenWhen:
                  (previous, current) => current is NewAddressSuccessState,
              listener: (context, state) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Successfuly")));
                Navigator.of(context).pop();
              },
              buildWhen:
                  (previous, current) =>
                      current is NewAddressInitial ||
                      current is NewAddressLoadingState ||
                      current is NewAddressSuccessState ||
                      current is NewAddressFailedState,
              builder: (context, state) {
                if (state is NewAddressLoadingState) {
                  return SliverToBoxAdapter(child: CustomLoadingIndecator());
                } else if (state is NewAddressFailedState) {
                  return SliverToBoxAdapter(child: Text(state.error));
                } else if (state is NewAddressSuccessState ||
                    state is NewAddressInitial) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButon(
                        text: "Add",
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
