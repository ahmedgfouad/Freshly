import 'package:flutter/material.dart';
import 'package:store/core/theme/styles.dart';
import 'package:store/features/account/presentation/profile/view/widgets/language_option_widget.dart';
import 'package:store/features/account/presentation/profile/view/widgets/logout_option_widget.dart';
import 'package:store/features/account/presentation/profile/view/widgets/mode_option_widget.dart';
import 'package:store/features/account/presentation/profile/view/widgets/notification_option_widget.dart';
import 'package:store/generated/l10n.dart';

class AppSettingsOptionsSectonWidget extends StatelessWidget {
  const AppSettingsOptionsSectonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).AppSettings, style: AppStyles.textStyle22(context)),
        const SizedBox(height: 20),
        const NotificationOptionWidget(),
        const SizedBox(height: 20),
        const ModeOptionWidget(),
        const SizedBox(height: 20),
        const LanguageOptionWidget(),
        const SizedBox(height: 20),
        const LogoutOptionWidget(),
      ],
    );
  }
} 

/*
ahmedgamal@gmail.com
ahmedgamal
*/