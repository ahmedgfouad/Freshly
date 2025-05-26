import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/registeration/presentation/view/widget/log_in_body_widget.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Sign In", context: context),
      body: LogInBodyWidget(),
    );
  }
}
