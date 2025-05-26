import 'package:flutter/material.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      labelColor: Colors.orange,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.orange,
      tabs: tabs,
    );
  }
}
