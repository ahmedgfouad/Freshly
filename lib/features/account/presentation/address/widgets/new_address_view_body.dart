import 'package:flutter/widgets.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';

class NewAddressViewBody extends StatelessWidget {
  const NewAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(hintText: "Governorate / City"),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(hintText: "Street Name"),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(
              hintText: "Building Number / Floor / Apartment",
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(hintText: "Nearest Landmark"),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(hintText: "Phone Number"),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButon(text: "Add", onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
