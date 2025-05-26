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
            child: CustomTextFormFieldWidget(hintText: "Address Title"),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(hintText: "Name Surname"),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(hintText: "City"),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWidget(hintText: "Address"),
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
