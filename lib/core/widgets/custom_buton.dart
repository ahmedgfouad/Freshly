import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class CustomButon extends StatelessWidget {
  CustomButon({
    super.key,
    this.bacgrouncColor,
    this.textColor,
    this.borderRadius,
    required this.text,
    required this.onPressed,
  });
  final void Function()? onPressed;
  Color? bacgrouncColor;
  Color? textColor;
  final BorderRadius? borderRadius;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: bacgrouncColor ?? context.appColors.orange,
          side: BorderSide(color: context.appColors.orange),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.textStyle18(context).copyWith(
            fontWeight: FontWeight.w700,
            color: textColor ?? context.appColors.white,
          ),
        ),
      ),
    );
  }
}
