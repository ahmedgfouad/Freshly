import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/core/widgets/custom_buton.dart';

class CustomEmptyPage extends StatelessWidget {
  const CustomEmptyPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.isOrderView = false,
  });
  final String image, title, subTitle;
  final bool isOrderView;

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
          style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(subTitle, style: AppStyles.textStyle16),
        Spacer(),
        CustomButon(
                text: "Start shoping",
                onPressed: () {
                  // myData.changeCurrenIndex(0);
                  isOrderView ? Navigator.pop(context) : null;
                },
              ),
        SizedBox(height: 20),
      ],
    );
  }
}
