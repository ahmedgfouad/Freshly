import 'package:flutter/material.dart';
import 'package:store/features/registeration/presentation/view/widget/welcom_view_body_widget.dart';

class WelcomView extends StatelessWidget {
  const WelcomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WelcomViewBodyWidget());
  }
}
