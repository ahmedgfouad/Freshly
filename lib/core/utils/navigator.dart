import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void navigateTo(String pageName, BuildContext context,) {
  GoRouter.of(context).push(pageName);
}

void navigateAndReplacement(String pageName, BuildContext context) {
  GoRouter.of(context).pushReplacement(pageName);
}
