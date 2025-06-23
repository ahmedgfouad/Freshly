import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/theme/colors.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/theme/styles.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';
import 'package:store/features/registeration/presentation/view/widget/pas_textformfield_widget.dart';
import 'package:store/generated/l10n.dart';

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
        const SizedBox(height: 8),
        Text(S.of(context).LoginHint, style: AppStyles.textStyle18(context)),
        const SizedBox(height: 16),
        CustomTextFormFieldWidget(
          hintText: S.of(context).Email,
          controller: emailController,
        ),
        const SizedBox(height: 16),
        PasswordTextFormFieldWidget(
          hintName: S.of(context).Password,
          controller: passwordController,
        ),
        const SizedBox(height: 9),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              S.of(context).ForgotePassword,
              style: AppStyles.textStyle18(
                context,
              ).copyWith(color: context.appColors.orange),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
