import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/account/presentation/profile/manager/them_cubit/them_cubit.dart';

class ModeOptionWidget extends StatelessWidget {
  const ModeOptionWidget({
    super.key,
    required this.icon,
    required this.title,
    
  });

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
        final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors().browen, size: 30),
        SizedBox(width: 15),
         Text(
            title,
            style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
          ),
        
        Spacer(),
       Transform.scale(
      scale: .8,
      child: Switch(
        value: isDark,
        onChanged: (value) {
          context.read<ThemeCubit>().toggleTheme(value);
        },
        activeColor: AppColors().white,
        activeTrackColor: AppColors().orange,
        inactiveThumbColor: AppColors().white,
        inactiveTrackColor: AppColors().grey,
      ),
    ),
      ],
    );
  }
}
