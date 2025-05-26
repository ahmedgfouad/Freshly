import 'package:flutter/material.dart';

class CustomTabBarViewWiget extends StatelessWidget {
  const CustomTabBarViewWiget({super.key, required this.tabBarViewlist});
  final List<Widget> tabBarViewlist;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: TabBarView(children: tabBarViewlist));
  }
}
