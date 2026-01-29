import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class CusDatePicker extends StatefulWidget {
  const CusDatePicker({super.key});

  @override
  State<CusDatePicker> createState() => _CusDatePickerState();
}

class _CusDatePickerState extends State<CusDatePicker> {
  late DateTime _dateTime;
  final List<String> weekDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];
  late int _monthDays;
  late int _preMonthDays;
  late int _firstDayOffset;
  late int _nextMonthDays;

  @override
  void initState() {
    _dateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    _initCalendarData(_dateTime);
    super.initState();
  }

  void _initCalendarData(DateTime datetime) {
    _dateTime = datetime;
    _monthDays = DateTime(_dateTime.year, _dateTime.month + 1, 0).day;
    _firstDayOffset = DateTime(_dateTime.year, _dateTime.month, 1).weekday;
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
      height: 300,
      padding: AppLayout.paddingSmall.allPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
        border: Border.all(color: AppColor.borderColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => _changeMonth(-1),
                icon: Icon(
                  Icons.arrow_back,
                  size: 15,
                  color: AppColor.primaryColor,
                ),
              ),
              Text(_dateTime.enMonthYear),
              IconButton(
                onPressed: () => _changeMonth(1),
                icon: Icon(
                  Icons.arrow_forward,
                  size: 15,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
          AppLayout.paddingSmall.heightBox,
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 30,
                mainAxisExtent: 30,
              ),
              itemCount: _monthDays + _firstDayOffset + _nextMonthDays + 7,
              itemBuilder: (context, index) {
                if (index < 7) {
                  return Container(
                    padding: 2.allPadding,
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius: BorderRadius.circular(
                        AppLayout.borderRadius / 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        weekDays[index],
                        style: TextTheme.of(context).labelMedium,
                      ),
                    ),
                  );
                }
                if ((index - 6) < _firstDayOffset) {
                  return Center(
                    child: Text(
                      "${_preMonthDays - _firstDayOffset + index - 6}",
                      style: TextStyle(color: AppColor.hintColor),
                    ),
                  );
                }
                if (index >= _monthDays + 6 + _firstDayOffset) {
                  return Center(
                    child: Text(
                      "${index - 5 - _monthDays - _firstDayOffset}",
                      style: TextStyle(color: AppColor.hintColor),
                    ),
                  );
                }
                DateTime itemDateTime = DateTime(
                  _dateTime.year,
                  _dateTime.month,
                  index - _firstDayOffset - 5,
                );
                return Container(
                  decoration: BoxDecoration(
                    color: _dateTime == itemDateTime
                        ? Color(0xff15C0E6)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      AppLayout.borderRadius / 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "${itemDateTime.day}",
                      style: TextStyle(
                        color: _dateTime == itemDateTime
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
