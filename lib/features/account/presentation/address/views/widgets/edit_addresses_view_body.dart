import 'package:flutter/widgets.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';
import 'package:store/features/account/data/models/address_model.dart';

class EditAddressesViewBody extends StatelessWidget {
  const EditAddressesViewBody({super.key, required this.address});

    final AddressModel address;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(hintText: "Home"),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(hintText: "mati egh"),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(hintText: "Goteborg"),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(hintText: "Lungangen 6, 41722"),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButon(text: "Update Address", onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
