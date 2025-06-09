import 'package:flutter/widgets.dart';
import 'package:store/features/account/presentation/profile/view/widgets/change_password_textform_field_widget.dart';
import 'package:store/generated/l10n.dart';

class ChangePasswordFieldsSection extends StatelessWidget {
  const ChangePasswordFieldsSection({
    super.key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChangePasswordTextformFieldWidget(
          hintName: S.of(context).OldPassword,
          controller: oldPasswordController,
        ),
        const SizedBox(height: 50),
        ChangePasswordTextformFieldWidget(
          hintName: S.of(context).NewPassword,
          controller: newPasswordController,
        ),
        const SizedBox(height: 50),
        ChangePasswordTextformFieldWidget(
          hintName: S.of(context).ConfirmPassword,
          controller: confirmPasswordController,
        ),
      ],
    );
  }
}
