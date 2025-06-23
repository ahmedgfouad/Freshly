import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/router/app_router.dart';
import 'package:store/core/theme/colors.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/core/theme/styles.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/generated/l10n.dart';

class WelcomViewBodyWidget extends StatelessWidget {
  const WelcomViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 37, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.welcomImg,
              height: MediaQuery.of(context).size.height * .4,
            ),
           const SizedBox(height: 33),
            Text(
              S.of(context).Welcome,
              style: AppStyles.textStyle24(
                context,
              ).copyWith(color: context.appColors.browen),
            ),
            SizedBox(height: 16),
            Text(
              S.of(context).WelcomeDescription,
              textAlign: TextAlign.center,
              style: AppStyles.textStyle16(
                context,
              ).copyWith(color: context.appColors.browen),
            ),
           const Spacer(),
            CustomButon(
              onPressed: () => navigateTo(AppRouter.kSignUpView, context),
              bacgrouncColor: context.appColors.orange,
              textColor: context.appColors.white,
              text: S.of(context).Signup,
            ),
           const SizedBox(height: 16),
            CustomButon(
              onPressed: () => navigateTo(AppRouter.kLogInView, context),
              bacgrouncColor: context.appColors.white,
              textColor: context.appColors.browen,
              text: S.of(context).Signin,
            ),
            Expanded(child:const SizedBox()),
          ],
        ),
      ),
    );
  }
}
