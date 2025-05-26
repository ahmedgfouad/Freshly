import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/images.dart';
import 'package:store/core/utils/navigator.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/core/widgets/custom_buton.dart';

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
            SizedBox(height: 33),
            Text(
              "Welcome to our app",
              style: AppStyles.textStyle24.copyWith(color: AppColors().browen),
            ),
            SizedBox(height: 16),
            Text(
              "Shop online and get groceries delivered from stores to your home in as fast as 1 hour .",
              textAlign: TextAlign.center,
              style: AppStyles.textStyle16.copyWith(color: AppColors().browen),
            ),
            SizedBox(height: 50),
            CustomButon(
              onPressed: () => navigateTo(AppRouter.kSignUpView, context),
              bacgrouncColor: AppColors().orange,
              textColor: AppColors().white,
              text: "Sign up",
            ),
            SizedBox(height: 16),
            CustomButon(
              onPressed: () => navigateTo(AppRouter.kLogInView, context),
              bacgrouncColor: AppColors().white,
              textColor: AppColors().browen,
              text: "Sign in",
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
