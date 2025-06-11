import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/account/presentation/profile/view/widgets/language_option_widget.dart';
import 'package:store/features/account/presentation/profile/view/widgets/logout_option_widget.dart';
import 'package:store/features/account/presentation/profile/view/widgets/mode_option_widget.dart';
import 'package:store/features/account/presentation/profile/view/widgets/notification_option_widget.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_cubit.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_state.dart';
import 'package:store/generated/l10n.dart';

class AppSettingsOptionsSectonWidget extends StatelessWidget {
  const AppSettingsOptionsSectonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).AppSettings, style: AppStyles.textStyle22),
        const SizedBox(height: 20),
        NotificationOptionWidget(),
        const SizedBox(height: 20), 
        ModeOptionWidget(),
        const SizedBox(height: 20),
        LanguageOptionWidget(),
        const SizedBox(height: 20),
        BlocBuilder<AuthCubit, AuthState>(
          bloc: authCubit,
          buildWhen:
              (previous, current) =>
                  current is LoginSuccessState ||
                  current is SignupSuccessState ||
                  current is AuthInitial,
          builder: (context, state) {
            if (state is LoginSuccessState || state is SignupSuccessState) {
              return LogoutOptionWidget(
                icon: Icons.logout,
                title: S.of(context).Logout,
                onPressed: () async {
                  await authCubit.logout();
                },
              );
            } else if (state is AuthInitial) {
              return CustomLoadingIndecator();
            } else {
              return const Text("error");
            }
          },
        ),
      ],
    );
  }
} 

/*
ahmedgamal@gmail.com
ahmedgamal
*/