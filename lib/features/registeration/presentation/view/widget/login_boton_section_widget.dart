import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/router/app_router.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_cubit.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_state.dart';
import 'package:store/features/registeration/presentation/view/widget/custom_shimmer_button_widget.dart';
import 'package:store/generated/l10n.dart';

class LoninBotonSectionWidget extends StatelessWidget {
  const LoninBotonSectionWidget({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: authCubit,
      listenWhen:
          (previous, current) =>
              current is LoginSuccessState || current is LoginFailedState,
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
        if (state is AuthInitial) {
          return CustomButon(
            text: S.of(context).Signin,
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
          return CustomShimmerButton(text: S.of(context).Loggingn);
        }
      },
    );
  }
}
