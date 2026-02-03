import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_style.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.secondColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondColor,
      shadowColor:  AppColors.secondColor,
      surfaceTintColor:  AppColors.secondColor,
      scrolledUnderElevation:0
    ),
    textTheme: TextTheme(
      bodyMedium: AppTextStyle.bodyMedium
    ),
  );
}
