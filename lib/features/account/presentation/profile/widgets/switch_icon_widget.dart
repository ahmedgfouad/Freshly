import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';

class SwitchIconWidget extends StatefulWidget {
  const SwitchIconWidget({super.key});

  @override
  State<SwitchIconWidget> createState() => _SwitchIconWidgetState();
}

class _SwitchIconWidgetState extends State<SwitchIconWidget> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .8,
      child: Switch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
        },
        activeColor: AppColors().white,
        activeTrackColor: AppColors().orange,
        inactiveThumbColor: AppColors().white,
        inactiveTrackColor: AppColors().grey,
      ),
    );
  }
}
