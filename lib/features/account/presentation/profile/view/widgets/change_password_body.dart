import 'package:flutter/material.dart';
import 'package:store/features/account/presentation/profile/view/widgets/change_password_button_serction_widget.dart'; 
import 'package:store/features/account/presentation/profile/view/widgets/change_password_field_section_widget.dart';


class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 20,
          bottom: 30,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ChangePasswordFieldsSection(
                oldPasswordController: oldPasswordController,
                newPasswordController: newPasswordController,
                confirmPasswordController: confirmPasswordController,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ChangePasswordButtonSection(
                  formKey: formKey,
                  newPasswordController: newPasswordController,
                  confirmPasswordController: confirmPasswordController,
                  oldPasswordController: oldPasswordController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
