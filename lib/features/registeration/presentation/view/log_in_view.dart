import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/registeration/presentation/view/widget/log_in_body_widget.dart';
import 'package:store/generated/l10n.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: S.of(context).Signin, context: context),
      body: LogInBodyWidget(),
    );
  }
}
