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
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );

  static final TextStyle bodySmall = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: AppColors.defaultTextColor,
  );

  static final TextStyle labelMedium = TextStyle(
    fontSize: 8,
    color: AppColors.hintTextColor,
  );

  static final TextStyle labelSmall = TextStyle(
    fontSize: 6,
    color: AppColors.defaultTextColor,
  );
}
