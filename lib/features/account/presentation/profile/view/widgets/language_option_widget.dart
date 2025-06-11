import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/account/presentation/profile/manager/language_cubit/language_cubit.dart';
import 'package:store/generated/l10n.dart';

class LanguageOptionWidget extends StatelessWidget {
  const LanguageOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLang = context.watch<LanguageCubit>().state.languageCode;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.public, color: AppColors().browen, size: 30),
        const SizedBox(width: 15),
        Text(
          S.of(context).Language,
          style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              "En",
              style: AppStyles.textStyle18.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Transform.scale(
              scale: 0.8,
              child: Switch(
                value: currentLang == 'ar',
                onChanged: (value) {
                  context.read<LanguageCubit>().toggleLanguage();
                },
                activeColor: AppColors().white,
                activeTrackColor: AppColors().orange,
                inactiveThumbColor: AppColors().white,
                inactiveTrackColor: AppColors().browen,
              ),
            ),
            Text(
              "ع",
              style: AppStyles.textStyle20.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
