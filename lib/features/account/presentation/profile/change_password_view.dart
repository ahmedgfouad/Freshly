import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/presentation/profile/widgets/change_password_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Change Password", context: context),
      body: ChangePasswordBody(),
    );
  }
}
