import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/account/presentation/profile/manager/them_cubit/them_cubit.dart';
import 'package:store/generated/l10n.dart';

class ModeOptionWidget extends StatelessWidget {
  const ModeOptionWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.brightness_6_outlined, color: AppColors().browen, size: 30),
        SizedBox(width: 15),
        Text(
          S.of(context).Mode,
          style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),

        Spacer(),
        Icon(Icons.light_mode, size: 20, color: AppColors().orange),
        Transform.scale(
          scale: .8,
          child: Switch(
            value: isDark,
            onChanged: (value) {
              context.read<ThemeCubit>().toggleTheme(value);
            },
            activeColor: AppColors().white,
            activeTrackColor: AppColors().browen,
            inactiveThumbColor: AppColors().white,
            inactiveTrackColor: AppColors().orange,
          ),
        ),
        Icon(Icons.dark_mode, size: 20, color: AppColors().browen),
      ],
    );
  }
}
