import 'package:flutter/material.dart';
import 'package:store/features/account/presentation/profile/widgets/app_settings_options_secton_widget.dart';
import 'package:store/features/account/presentation/profile/widgets/profile_options_section_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileOptionsSectionWidget(),
          SizedBox(height: 20),
          AppSettingsOptionsSectonWidget(),
        ],
      ),
    );
  }
}
