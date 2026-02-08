import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_theme.dart';
import 'package:telegram_redesign/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.darkTheme,
    );
  }
}
