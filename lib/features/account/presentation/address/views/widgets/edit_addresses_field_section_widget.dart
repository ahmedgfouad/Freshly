import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        SizedBox(height: 30.h),
        CustomTextFormFieldWidget(
          hintText: "Street Name",
          controller: streetNameController,
        ),
        SizedBox(height: 30.h),
        CustomTextFormFieldWidget(
          hintText: "Building Number / Floor / Apartment",
          controller: buildingNumberController,
        ),
        SizedBox(height: 30.h),
        CustomTextFormFieldWidget(
          hintText: "Nearest Landmark",
          controller: nearestLandmarkController,
        ),
        SizedBox(height: 30.h),
        CustomTextFormFieldWidget(
          keyboardType: TextInputType.phone,
          hintText: "Phone Number",
          controller: phoneNumberController,
        ),
      ],
    );
  }
}
