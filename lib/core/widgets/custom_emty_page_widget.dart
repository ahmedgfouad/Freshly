import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:store/generated/l10n.dart';

class CustomEmptyPage extends StatelessWidget {
  const CustomEmptyPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: SvgPicture.asset(image),
        ),
        SizedBox(height: 15),
        Text(
          title,
          style: AppStyles.textStyle20(
            context,
          ).copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(subTitle, style: AppStyles.textStyle16(context)),
        Spacer(),
        CustomButon(
          text: S.of(context).StartShoping,
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).changeIndex(0);
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
