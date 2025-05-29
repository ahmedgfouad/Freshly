import 'package:flutter/widgets.dart';
import 'package:store/features/account/data/models/address_model.dart';
import 'package:store/features/account/presentation/address/views/widgets/edit_addresses_field_section_widget.dart';
import 'package:store/features/account/presentation/address/views/widgets/update_address_buton_sedtin_widget.dart';

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
  final formKey = GlobalKey<FormState>();

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
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: EditAddressesFieldSectionWidger(
                cityController: cityController,
                streetNameController: streetNameController,
                buildingNumberController: buildingNumberController,
                nearestLandmarkController: nearestLandmarkController,
                phoneNumberController: phoneNumberController,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: UpdateAddressButonSectionWiget(
                  formKey: formKey,
                  id: widget.address.id,
                  cityController: cityController,
                  streetNameController: streetNameController,
                  buildingNumberController: buildingNumberController,
                  nearestLandmarkController: nearestLandmarkController,
                  phoneNumberController: phoneNumberController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
