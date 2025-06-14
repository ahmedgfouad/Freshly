import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/presentation/profile/view/widgets/edit_profile_body.dart';
import 'package:store/generated/l10n.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: S.of(context).EditProfile, context: context),
      body: EditProfileBody(),
    );
  }
}
