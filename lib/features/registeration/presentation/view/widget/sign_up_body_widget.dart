import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_cubit.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_state.dart';
import 'package:store/features/registeration/presentation/view/widget/pas_textformfield_widget.dart';

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
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.signUpImg,
                width: MediaQuery.of(context).size.height / 4,
              ),
              SizedBox(height: 13),
              Text(
                "Please enter your information to create an account.",
                style: AppStyles.textStyle18,
              ),
              SizedBox(height: 17),
              CustomTextFormFieldWidget(
                hintText: 'Name',
                controller: nameController,
              ),
              SizedBox(height: 17),
              CustomTextFormFieldWidget(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                controller: emailController,
              ),
              SizedBox(height: 17),
              PasswordTextFormFieldWidget(
                hintName: "Password",
                controller: passwordController,
              ),
              SizedBox(height: 17),
              PasswordTextFormFieldWidget(
                hintName: "Confirm Password",
                controller: confirmPasswordController,
              ),
              SizedBox(height: 8),
              BlocConsumer<AuthCubit, AuthState>(
                bloc: authCubit,
                listenWhen:
                    (previous, current) =>
                        current is SignupSuccessState ||
                        current is SignupFailedState,
                listener: (context, state) {
                  if (state is SignupSuccessState) {
                    navigateAndReplacement(AppRouter.kHomeView, context);
                  } else if (state is SignupFailedState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("error in auth")));
                  }
                },
                buildWhen:
                    (previous, current) =>
                        current is AuthInitial ||
                        current is SignupLoadingState ||
                        current is SignupSuccessState ||
                        current is SignupFailedState,
                builder: (context, state) {
                  if (state is SignupFailedState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("error in auth")));
                  }
                  if (state is AuthInitial) {
                    return CustomButon(
                      bacgrouncColor: AppColors().orange,
                      textColor: AppColors().white,
                      text: "Sign Up",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await authCubit.signup(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                          );
                        }
                      },
                    );
                  } else {
                    return CustomLoadingIndecator();
                  }
                },
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
