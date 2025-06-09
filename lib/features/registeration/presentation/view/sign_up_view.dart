import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/registeration/presentation/view/widget/sign_up_body_widget.dart';
import 'package:store/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: S.of(context).Signup, context: context),
      body: SignUpBodyWidget(),
    );
  }
}
