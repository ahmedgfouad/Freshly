import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/account/presentation/profile/view/widgets/language_option_widget.dart';
import 'package:store/features/account/presentation/profile/view/widgets/logout_option_widget.dart';
import 'package:store/features/account/presentation/profile/view/widgets/notification_option_widget.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_cubit.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_state.dart';

class AppSettingsOptionsSectonWidget extends StatelessWidget {
  const AppSettingsOptionsSectonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("App Settings", style: AppStyles.textStyle22),
        SizedBox(height: 20),
        NotificationOptionWidget(
          icon: Icons.notifications,
          title: 'Notifications',
          onPressed: () {},
        ),
        SizedBox(height: 20),
        LanguageOptionWidget(
          icon: Icons.g_translate_sharp,
          title: "Language",
          onPressed: () {},
        ),
        SizedBox(height: 20),
        BlocConsumer<AuthCubit, AuthState>(
          bloc: authCubit,
          listenWhen:
              (previous, current) =>
                  current is LoginSuccessState ||
                  current is SignupSuccessState ||
                  current is AuthInitial,
          listener: (context, state) {
            if (state is AuthInitial) {
              navigateAndReplacement(AppRouter.kWelcomView, context);
            }
          },
          buildWhen:
              (previous, current) =>
                  current is LoginSuccessState ||
                  current is SignupSuccessState ||
                  current is AuthInitial,
          builder: (context, state) {
            if (state is LoginSuccessState || state is SignupSuccessState) {
              return LogoutOptionWidget(
                icon: Icons.logout,
                title: "Log Out",
                onPressed: () async {
                  await authCubit.logout();
                },
              );
            } else {
              return Text("error");
            }
          },
        ),
      ],
    );
  }
}
