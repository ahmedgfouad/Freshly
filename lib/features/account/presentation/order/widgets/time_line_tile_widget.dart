import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileWidget extends StatelessWidget {
  const TimelineTileWidget({
    super.key,
    required this.isFirst,
    required this.image,
    required this.title,
    this.isLast = false,
    this.isCheck = true,
  });
  final bool isFirst, isLast, isCheck;

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      alignment: TimelineAlign.manual,
      lineXY: 0.01,
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: isCheck ? context.appColors.green : context.appColors.grey,
        iconStyle:
            isCheck
                ? IconStyle(
                  iconData: Icons.check,
                  color: context.appColors.white,
                )
                : null,
      ),
      beforeLineStyle: LineStyle(color: context.appColors.grey, thickness: 1),
      afterLineStyle: LineStyle(color: context.appColors.grey, thickness: 1),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(image),
            SizedBox(width: 10),
            Expanded(child: Text(title, style: AppStyles.textStyle16(context))),
          ],
        ),
      ),
    );
  }
}
