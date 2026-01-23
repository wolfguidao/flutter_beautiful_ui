import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      textTheme: TextTheme(
        displayLarge: AppTextStyle.h1,
        displayMedium: AppTextStyle.h2,
        displaySmall: AppTextStyle.h3,
        bodyMedium: AppTextStyle.bodyMedium,
        labelMedium: AppTextStyle.caption,
        labelSmall: AppTextStyle.captionSmall,
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: Color(0xffE5E6E9),
        color: AppColor.primaryColor,
        strokeCap: StrokeCap.round,
        strokeWidth: 2.5,
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          overlayColor: Colors.transparent,
          padding: EdgeInsets.zero,
          minimumSize: Size(30, 30),
          maximumSize: Size(30, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppLayout.borderRadius * 0.8),
          ),
          backgroundColor: AppColor.secondColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          ),

          shadowColor: Color(0xffDFECFF),
          foregroundColor: Colors.white,
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: AppColor.hintColor,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        fillColor: Colors.white,
        filled: true,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppLayout.paddingSmall * 0.5,
          vertical: AppLayout.paddingSmall * 1.2,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
      ),
    );
  }
}
