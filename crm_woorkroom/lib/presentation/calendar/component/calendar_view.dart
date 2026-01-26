import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/calendar/widgets/calendar_item.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime _dateTime;
  late int _monthDays;
  late int _preMonthDays;
  late int _firstDayOffset;
  late int _nextMonthDays;

  @override
  void initState() {
    _initCalendarData(DateTime.now());
    super.initState();
  }

  void _initCalendarData(DateTime datetime) {
    _dateTime = datetime;
    _monthDays = DateTime(_dateTime.year, _dateTime.month + 1, 0).day;
    _firstDayOffset = DateTime(_dateTime.year, _dateTime.month, 1).weekday - 1;
    _preMonthDays = DateTime(_dateTime.year, _dateTime.month, 0).day;
    _nextMonthDays = 7 - (_firstDayOffset + _monthDays % 7);
  }

  void _changeMonth(int index) {
    setState(() {
      DateTime changeDateTime = DateTime(
        _dateTime.year,
        _dateTime.month + index,
      );
      _initCalendarData(changeDateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.secondColor,
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => _changeMonth(-1),
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColor.primaryColor,
                  size: 15,
                ),
              ),
              Text(_dateTime.enMonthYear),
              IconButton(
                onPressed: () => _changeMonth(1),
                icon: Icon(
                  Icons.arrow_forward,
                  color: AppColor.primaryColor,
                  size: 15,
                ),
              ),
            ],
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: _monthDays + _firstDayOffset + _nextMonthDays,
                itemBuilder: (context, index) {
                  Border? border;
                  late String text;
                  TextStyle? textStyle;
                  late DateTime date;
                  if ((index + 1) % 7 == 0) {
                    border = Border(
                      top: BorderSide(color: AppColor.borderColor),
                    );
                  } else {
                    border = Border(
                      top: BorderSide(color: AppColor.borderColor),
                      right: BorderSide(color: AppColor.borderColor),
                    );
                  }
                  if (index < _firstDayOffset) {
                    text = (_preMonthDays - _firstDayOffset + index + 1)
                        .toString();
                    textStyle = TextTheme.of(context).labelMedium;
                    date = DateTime(
                      _dateTime.year,
                      _dateTime.month - 1,
                      _preMonthDays - _firstDayOffset + index + 1,
                    );
                  } else if (index >= _monthDays + _firstDayOffset) {
                    text = (index - _monthDays - _firstDayOffset + 1)
                        .toString();
                    textStyle = TextTheme.of(context).labelMedium;
                    date = DateTime(
                      _dateTime.year,
                      _dateTime.month + 1,
                      index - _monthDays - _firstDayOffset + 1,
                    );
                  } else {
                    text = (index + 1 - _firstDayOffset).toString();
                    textStyle = TextTheme.of(context).bodySmall;
                    date = DateTime(
                      _dateTime.year,
                      _dateTime.month,
                      index + 1 - _firstDayOffset,
                    );
                  }
                  print(date);
                  return CalendarItem(
                    text: text,
                    textStyle: textStyle,
                    index: index,
                    date: date,
                    border: border,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
