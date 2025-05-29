
import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';

class EditAddressesFieldSectionWidger extends StatelessWidget {
  const EditAddressesFieldSectionWidger({
    super.key,
    required this.cityController,
    required this.streetNameController,
    required this.buildingNumberController,
    required this.nearestLandmarkController,
    required this.phoneNumberController,
  });

  final TextEditingController cityController;
  final TextEditingController streetNameController;
  final TextEditingController buildingNumberController;
  final TextEditingController nearestLandmarkController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
