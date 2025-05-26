import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class PasswordTextFormFieldWidget extends StatefulWidget {
  PasswordTextFormFieldWidget({
    super.key,
    required this.hintName,
    this.isObscureText = true,
    this.controller
  });

  final String hintName;
  bool isObscureText;
  final TextEditingController? controller;

  @override
  State<PasswordTextFormFieldWidget> createState() =>
      _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState
    extends State<PasswordTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your ${widget.hintName}';
        }
        return null;
      },
      cursorColor: AppColors().orange,
      obscureText: widget.isObscureText,
      decoration: InputDecoration(
        suffixIconColor: AppColors().orange,
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
        hintStyle: AppStyles.textStyle16.copyWith(color: Color(0xffAC8E71)),
        fillColor: AppColors().ofWhite,
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
