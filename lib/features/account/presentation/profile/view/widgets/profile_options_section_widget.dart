import 'package:flutter/material.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/features/account/presentation/profile/view/widgets/profile_option_widget.dart';

class ProfileOptionsSectionWidget extends StatelessWidget {
  const ProfileOptionsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionWidget(
          icon: Icons.person,
          title: "Edit Profile",
          onPressed: () {
            navigateTo(AppRouter.kEditProfileView, context);
          },
        ),
        const SizedBox(height: 10),
        ProfileOptionWidget(
          icon: Icons.key_outlined,
          title: "Change Password",
          onPressed: () {
            navigateTo(AppRouter.kChangePasswordView, context);
          },
        ),
       const SizedBox(height: 10),
        ProfileOptionWidget(
          icon: Icons.payment,
          title: "My Cards",
          onPressed: () {},
        ),
      ],
    );
  }
}
