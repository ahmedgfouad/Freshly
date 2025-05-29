import 'package:flutter/material.dart';
import 'package:store/features/registeration/presentation/view/widget/signup_boton_section_widget.dart';
import 'package:store/features/registeration/presentation/view/widget/singup_fields_section_widget.dart';

class SignUpBodyWidget extends StatefulWidget {
  const SignUpBodyWidget({super.key});

  @override
  State<SignUpBodyWidget> createState() => _SignUpBodyWidgetState();
}

class _SignUpBodyWidgetState extends State<SignUpBodyWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SignupFieldsSectionWidget(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              ),
              SignupBotonSectionWidget(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
                nameController: nameController,
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
