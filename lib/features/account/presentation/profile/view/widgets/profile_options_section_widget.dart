import 'package:flutter/material.dart';
import 'package:store/core/router/app_router.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/features/account/presentation/profile/view/widgets/profile_option_widget.dart';
import 'package:store/generated/l10n.dart';

class ProfileOptionsSectionWidget extends StatelessWidget {
  const ProfileOptionsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionWidget(
          icon: Icons.person,
          title: S.of(context).EditProfile,
          onPressed: () {
            navigateTo(AppRouter.kEditProfileView, context);
          },
        ),
        const SizedBox(height: 20),
        ProfileOptionWidget(
          icon: Icons.key_outlined,
          title: S.of(context).ChangePassword,
          onPressed: () {
            navigateTo(AppRouter.kChangePasswordView, context);
          },
        ),
        const SizedBox(height: 20),
        ProfileOptionWidget(
          icon: Icons.payment,
          title: S.of(context).MyCards,
          onPressed: () {},
        ),
      ],
    );
  }
}
