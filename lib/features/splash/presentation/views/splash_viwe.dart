import 'package:flutter/material.dart';
import 'package:store/features/splash/presentation/views/widgets/splash_body_widget.dart';

class SplashViwe extends StatelessWidget {
  const SplashViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashBodyWidget());
  }
}
