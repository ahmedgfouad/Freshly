
import 'package:flutter/widgets.dart';
import 'package:store/features/account/presentation/profile/view/widgets/change_password_textform_field_widget.dart';

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
          hintName: "Old Password",
          controller: oldPasswordController,
        ),
        SizedBox(height: 25),
        ChangePasswordTextformFieldWidget(
          hintName: "New Password",
          controller: newPasswordController,
        ),
        SizedBox(height: 25),
        ChangePasswordTextformFieldWidget(
          hintName: "Confirm Password",
          controller: confirmPasswordController,
        ),
      ],
    );
  }
}
