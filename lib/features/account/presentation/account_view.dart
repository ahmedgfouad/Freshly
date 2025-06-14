import 'package:flutter/material.dart';
import 'package:store/core/widgets/custom_app_bar.dart';
import 'package:store/features/account/presentation/widget/account_view_body.dart';
import 'package:store/features/home/presentation/view/widgets/animation_tab_view.dart';
import 'package:store/generated/l10n.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTabView(
      tabIndex: 4, // رقم التاب الخاص بـ Account
      child: Scaffold(
        appBar: customAppBar(
          title: S.of(context).Account,
          context: context,
          arrowBack: false,
        ),
        body: const AccountViewBody(),
      ),
    );
  }
}
