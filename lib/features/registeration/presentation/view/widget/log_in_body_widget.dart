import 'package:flutter/material.dart'; 
import 'package:store/features/registeration/presentation/view/widget/login_boton_section_widget.dart';
import 'package:store/features/registeration/presentation/view/widget/login_fields_section_widget.dart';

class LogInBodyWidget extends StatefulWidget {
  const LogInBodyWidget({super.key});

  @override
  State<LogInBodyWidget> createState() => _LogInBodyWidgetState();
}

class _LogInBodyWidgetState extends State<LogInBodyWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginFieldsSectionWidget(
                emailController: emailController,
                passwordController: passwordController,
              ),
              LoninBotonSectionWidget(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
