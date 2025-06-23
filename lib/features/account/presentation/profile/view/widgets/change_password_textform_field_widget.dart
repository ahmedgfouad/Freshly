import 'package:flutter/material.dart';
import 'package:store/core/theme/colors.dart';
import 'package:store/core/theme/styles.dart';

class ChangePasswordTextformFieldWidget extends StatefulWidget {
  ChangePasswordTextformFieldWidget({
    super.key,
    required this.hintName,
    this.isObscureText = true,
    this.controller,
  });

  final String hintName;
  bool isObscureText;
  TextEditingController? controller;

  @override
  State<ChangePasswordTextformFieldWidget> createState() =>
      _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState
    extends State<ChangePasswordTextformFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your ${widget.hintName}';
        }
        return null;
      },
      controller: widget.controller,
      cursorColor: context.appColors.orange,
      obscureText: widget.isObscureText,
      decoration: InputDecoration(
        suffixIconColor: context.appColors.orange,
        prefixIcon: Icon(Icons.lock, color: context.appColors.orange),
        suffixIcon: IconButton(
          onPressed: () {
            widget.isObscureText = !widget.isObscureText;
            setState(() {});
          },
          icon:
              widget.isObscureText
                  ? Icon(Icons.visibility_outlined)
                  : Icon(Icons.visibility_off_outlined),
        ),
        hintText: widget.hintName,
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
