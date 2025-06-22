import 'package:flutter/material.dart';
import 'package:store/core/thems/colors.dart';
import 'package:store/core/thems/styles.dart';
import 'package:store/generated/l10n.dart';

class CustomSearchTextFormFieldWidget extends StatelessWidget {
  const CustomSearchTextFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: context.appColors.orange,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Color(0xffAC8E71)),
        hintText: S.of(context).Search,
        hintStyle: AppStyles.textStyle16(
          context,
        ).copyWith(color: Color(0xffAC8E71)),
        fillColor: context.appColors.offWhite,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
