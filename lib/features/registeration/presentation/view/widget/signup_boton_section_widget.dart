import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/router/app_router.dart';
import 'package:store/core/theme/colors.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_cubit.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_state.dart';
import 'package:store/features/registeration/presentation/view/widget/custom_shimmer_button_widget.dart';
import 'package:store/generated/l10n.dart';

class SignupBotonSectionWidget extends StatelessWidget {
  const SignupBotonSectionWidget({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: authCubit,
      listenWhen:
          (previous, current) =>
              current is SignupSuccessState || current is SignupFailedState,
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
            bacgrouncColor: context.appColors.orange,
            textColor: context.appColors.white,
            text: S.of(context).Signup,
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
          return CustomShimmerButton(text: S.of(context).SignupLoading);
        }
      },
    );
  }
}
