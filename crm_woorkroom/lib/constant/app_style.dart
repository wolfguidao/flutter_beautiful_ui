import 'package:flutter/material.dart';

class AppColor {
  static final Color primaryColor = Color(0xff3F8CFF);
  static final Color backgroundColor = Color(0xffF4F9FD);
  static final Color secondColor = Colors.white;
  static final Color hintColor = Color(0xff7D8592);
  static final Color textColor = Color(0xff0A1629);
  static final Color borderColor = Color(0xffD8E0F0);
}

class AppLayout {
  static final double borderRadius = 10;
  static final double paddingSmall = 10;
  static final double paddingMedium = 15;
  static final double paddingLarge = 20;
}

class AppTextStyle {
  static final TextStyle h1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColor.textColor,
  );

  static final TextStyle h2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.textColor,
  );

  static final TextStyle h3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.textColor,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.textColor,
  );

  static final TextStyle caption = TextStyle(
    fontSize: 10,
    color: AppColor.hintColor,
  );

  static final TextStyle captionSmall = TextStyle(
    fontSize: 8,
    color: AppColor.hintColor,
  );
}
