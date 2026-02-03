import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_theme.dart';
import 'package:telegram_redesign/presentation/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.darkTheme, home: HomePage());
  }
}
