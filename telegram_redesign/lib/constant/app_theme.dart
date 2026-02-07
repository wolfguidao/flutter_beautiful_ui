import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/constant/app_style.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.secondColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondColor,
      shadowColor: AppColors.secondColor,
      surfaceTintColor: AppColors.secondColor,
      scrolledUnderElevation: 0,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: CircleBorder(),
      checkColor: WidgetStatePropertyAll(Colors.white),
      fillColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return Colors.transparent;
      }),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(foregroundColor: AppColors.primaryColor),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isCollapsed: false,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadius * 10),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      hintStyle: AppTextStyle.labelMedium,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadius * 10),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      fillColor: Color(0xff0F1215),
      contentPadding: AppLayout.paddingSmall.horizontalPadding,
    ),
    textTheme: TextTheme(
      bodyMedium: AppTextStyle.bodyMedium,
      bodySmall: AppTextStyle.bodySmall,
      bodyLarge: AppTextStyle.bodyLarge,
      displaySmall: AppTextStyle.displaySmall,
      displayMedium: AppTextStyle.displayMedium,
      displayLarge: AppTextStyle.displayLarge,
      labelMedium: AppTextStyle.labelMedium,
      labelSmall: AppTextStyle.labelSmall,
    ),
  );
}
