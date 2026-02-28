import 'package:ai_chat/constant/app_enum.dart';
import 'package:flutter/material.dart';

extension SizeExtension on num {
  Widget get heightBox => SizedBox(height: toDouble());
  Widget get widthBox => SizedBox(width: toDouble());

  EdgeInsets get allPadding => EdgeInsets.all(toDouble());
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());
}

extension EnglishMonth on DateTime {
  String get enMonth {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "";
    }
  }

  String get enWeekDay {
    switch (weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "";
    }
  }

  String get enMonthYear => "$enMonth,$year";

  String get fullDate => "$enMonth $day, $year";

  String get messageTime {
    DateTime now = DateTime.now();
    if (difference(now).inDays != 0) {
      return "$month.$day";
    }
    return "$hour:$minute";
  }
}

extension ResponsiveContext on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  TextTheme get textTheme=>Theme.of(this).textTheme;

  DeviceType get deviceType {
    if (width >= 1042) return DeviceType.desktop;
    if (width >= 600) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isDesktop => deviceType == DeviceType.desktop;
  bool get isTablet => deviceType == DeviceType.tablet;
}
