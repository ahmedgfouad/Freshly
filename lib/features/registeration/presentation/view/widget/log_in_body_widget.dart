import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.logInImg,
                width: MediaQuery.of(context).size.height / 4,
              ),
              SizedBox(height: 8),
              Text(
                "Enter your Email and password to access your account",
                style: AppStyles.textStyle18,
              ),
              SizedBox(height: 16),
              CustomTextFormFieldWidget(
                hintText: "Email",
                controller: emailController,
              ),
              SizedBox(height: 16),
              PasswordTextFormFieldWidget(
                hintName: "Password",
                controller: passwordController,
              ),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgote Password",
                    style: AppStyles.textStyle18.copyWith(
                      color: AppColors().orange,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              BlocConsumer<AuthCubit, AuthState>(
                bloc: authCubit,
                listenWhen:
                    (previous, current) =>
                        current is LoginSuccessState ||
                        current is LoginFailedState,
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    navigateAndReplacement(AppRouter.kHomeView, context);
                  } else if (state is LoginFailedState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("error in auth")));
                  }
                },
                buildWhen:
                    (previous, current) =>
                        current is AuthInitial ||
                        current is LoginLoadingState ||
                        current is LoginSuccessState ||
                        current is LoginFailedState,
                builder: (context, state) {
                  if (state is LoginFailedState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("error in auth")));
                  }
                  if (state is AuthInitial) {
                    return CustomButon(
                      text: "Sign In",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await authCubit.login(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                    );
                  } else {
                    return CustomLoadingIndecator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
