
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';
import 'package:store/features/registeration/presentation/view/widget/pas_textformfield_widget.dart';

class LoginFieldsSectionWidget extends StatelessWidget {
  const LoginFieldsSectionWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppImages.logInImg,
          width: MediaQuery.of(context).size.height / 4,
        ),
        SizedBox(height: 8),
        Text(
          "Enter your Email and password to access your account",
          style: AppStyles.textStyle18,
        ),
        SizedBox(height: 16),
        CustomTextFormFieldWidget(
          hintText: "Email",
          controller: emailController,
        ),
        SizedBox(height: 16),
        PasswordTextFormFieldWidget(
          hintName: "Password",
          controller: passwordController,
        ),
        SizedBox(height: 9),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Forgote Password",
              style: AppStyles.textStyle18.copyWith(color: AppColors().orange),
            ),
          ],
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
