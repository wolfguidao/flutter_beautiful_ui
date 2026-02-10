import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';

class AppTextStyle {
  static final TextStyle displayLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.defaultTextColor,
  );

  static final TextStyle displayMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.defaultTextColor,
  );

  static final TextStyle displaySmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.defaultTextColor,
  );

  static final TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );

  static final TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );

  static final TextStyle labelLarge = TextStyle(
    fontSize: 15,
    color: AppColors.hintTextColor,
  );

  static final TextStyle labelMedium = TextStyle(
    fontSize: 12,
    color: AppColors.hintTextColor,
  );

  static final TextStyle labelSmall = TextStyle(
    fontSize: 10,
    color: AppColors.hintTextColor,
  );
}
