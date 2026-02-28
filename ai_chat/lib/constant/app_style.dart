import 'package:flutter/material.dart';

class AppColor {
  static final Color primaryColor = Color(0xff2563eb);
  static final Color backgroundColor = Color(0xffeff6ff);
  static final Color borderColo = Color(0xffdbeafe);
  static final Color purplePotColor = Color(0xffe9d5ff);
  static final Color bluePotColor = Color(0xff93c5fd);
  static final Color loadingColor = Color(0xff60a5fa);
  static final Color userMessageBubble = Color(0xff2563eb);
  static final Color hoverColor = Color(0xfff8fafc);
  static final Color shadowColor = Color(0xfff1f5f9);
  static final Color bodyTextColor = Color(0xff475569);
  static final Color strengthColor = Color(0xff334155);
  static final Color textSelectedColor = Color(0xffe0e7ff);
  static final Color purpleBorderColor = Color(0xfff3e8ff);

  static final Color secondColor = Colors.white;
  static final Color hintColor = Color(0xff7D8592);
  static final Color textColor = Color(0xff0A1629);
  static final Color borderColor = Color(0xffD8E0F0);
  static final Color barrierColor = Color(0xffD2DFEF).withAlpha(125);
}

class AppLayout {
  static final double borderRadius = 10;
  static final double paddingSmall = 10;
  static final double paddingMedium = 15;
  static final double paddingLarge = 20;
  static final double borderWidth = 2;
}

class AppTextStyle {
  static final TextStyle h1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.textColor,
  );

  static final TextStyle h2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColor.textColor,
  );

  static final TextStyle h3 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColor.textColor,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.bodyTextColor,
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
