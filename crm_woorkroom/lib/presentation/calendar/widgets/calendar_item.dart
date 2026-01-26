import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/calendar.dart';
import 'package:flutter/material.dart';

class CalendarItem extends StatelessWidget {
  final Border? border;
  final String text;
  final TextStyle? textStyle;
  final int index;
  final DateTime date;
  const CalendarItem({
    super.key,
    this.border,
    required this.text,
    this.textStyle,
    required this.index,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    String getCalendarTitle(int index) {
      switch (index) {
        case 0:
          return "Mon";
        case 1:
          return "Tue";
        case 2:
          return "Wed";
        case 3:
          return "Thu";
        case 4:
          return "Fri";
        case 5:
          return "Sat";
        case 6:
          return "Sun";
        default:
          return "";
      }
    }

    List<Calendar> calendarList = AppMock.calendarList
        .where((e) => e.createTime == date)
        .toList();
    return Container(
      padding: (AppLayout.paddingSmall / 2).allPadding,
      decoration: BoxDecoration(border: border),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index < 7)
                      Container(
                        padding: (AppLayout.paddingSmall * 0.2).allPadding,
                        decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.circular(
                            AppLayout.borderRadius / 2,
                          ),
                        ),
                        child: Text(
                          getCalendarTitle(index),
                          style: TextTheme.of(context).labelSmall,
                        ),
                      ),
                    ...calendarList.take(2).map((calendar) {
                      return Container(
                        margin: EdgeInsets.only(top: AppLayout.paddingSmall),
                        padding: (AppLayout.paddingSmall * 0.2).allPadding,
                        decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              AppLayout.borderRadius / 2,
                            ),
                            bottomRight: Radius.circular(
                              AppLayout.borderRadius / 2,
                            ),
                          ),
                          border: Border(
                            left: BorderSide(
                              color: calendar.priority.color,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              calendar.title,
                              style: TextTheme.of(context).bodySmall,
                            ),
                            Row(
                              children: [
                                Text(
                                  calendar.spentTime,
                                  style: TextTheme.of(context).labelSmall,
                                ),
                                Icon(
                                  Icons.arrow_upward,
                                  color: calendar.priority.color,
                                  size: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              AppLayout.paddingSmall.widthBox,
              Text(text, style: textStyle),
            ],
          ),
          if (calendarList.length > 2)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: (AppLayout.paddingSmall / 2).allPadding,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primaryColor,
                ),
                child: Center(
                  child: Text(
                    "+${calendarList.length - 2}",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
