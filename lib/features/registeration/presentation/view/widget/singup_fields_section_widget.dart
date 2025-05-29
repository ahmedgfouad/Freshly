
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';
import 'package:store/features/registeration/presentation/view/widget/pas_textformfield_widget.dart';

class SignupFieldsSectionWidget extends StatelessWidget {
  const SignupFieldsSectionWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppImages.signUpImg,
          width: MediaQuery.of(context).size.height / 4,
        ),
        SizedBox(height: 13),
        Text(
          "Please enter your information to create an account.",
          style: AppStyles.textStyle18,
        ),
        SizedBox(height: 17),
        CustomTextFormFieldWidget(hintText: 'Name', controller: nameController),
        SizedBox(height: 17),
        CustomTextFormFieldWidget(
          keyboardType: TextInputType.emailAddress,
          hintText: 'Email',
          controller: emailController,
        ),
        SizedBox(height: 17),
        PasswordTextFormFieldWidget(
          hintName: "Password",
          controller: passwordController,
        ),
        SizedBox(height: 17),
        PasswordTextFormFieldWidget(
          hintName: "Confirm Password",
          controller: confirmPasswordController,
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
