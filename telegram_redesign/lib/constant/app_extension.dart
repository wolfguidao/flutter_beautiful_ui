import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get iconSize=>MediaQuery.sizeOf(this).width*0.05;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension SizeExtension on num {
  Widget get heightBox => SizedBox(height: toDouble());
  Widget get widthBox => SizedBox(width: toDouble());


  EdgeInsets get allPadding => EdgeInsets.all(toDouble());
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());
}

extension EnglishTime on DateTime{
  String get enMonth {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
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

  String get enTimeByNow{
    final DateTime now=DateTime.now();
    int differenceDay=difference(now).inDays;
    if(differenceDay!=0){
      return "$hour:$minute";
    }
    return "$enMonth $day";
  }

}