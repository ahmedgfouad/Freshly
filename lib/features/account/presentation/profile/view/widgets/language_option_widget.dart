import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/thems/colors.dart';
import 'package:store/core/thems/styles.dart';
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
        Icon(Icons.public, color: context.appColors.browen, size: 30),
        const SizedBox(width: 15),
        Text(
          S.of(context).Language,
          style: AppStyles.textStyle18(
            context,
          ).copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          "En",
          style: AppStyles.textStyle16(context).copyWith(
            fontWeight: FontWeight.bold,
            color: context.appColors.orange,
          ),
        ),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: currentLang == 'ar',
            onChanged: (value) {
              context.read<LanguageCubit>().toggleLanguage();
            },
            activeColor: context.appColors.white,
            activeTrackColor: context.appColors.browen,
            inactiveThumbColor: context.appColors.white,
            inactiveTrackColor: context.appColors.orange,
          ),
        ),
        Text(
          "ع",
          style: AppStyles.textStyle20(
            context,
          ).copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
