import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/presentation/widget/account_view_body.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Account",
        context: context,
        arrowBack: false,
      ),
      body: AccountViewBody(),
    );
  }
}
