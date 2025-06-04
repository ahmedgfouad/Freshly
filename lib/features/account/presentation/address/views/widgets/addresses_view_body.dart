import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/features/account/presentation/address/views/widgets/addresses_section_widget.dart';
import 'package:store/features/account/presentation/address/views/widgets/show_Address_options_widget.dart';

class AddressesViewBody extends StatelessWidget {
  const AddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: [
          Expanded(child: AddressesSectionWidget()),
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
