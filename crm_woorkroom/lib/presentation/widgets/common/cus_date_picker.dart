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
  DateTime? _secondTime;
  DateTime? _hoveredDate;

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
      height: 320,
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisExtent: 40,
              ),
              itemCount: _monthDays + _firstDayOffset + _nextMonthDays + 7,
              itemBuilder: (context, index) {
                if (index < 7) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppLayout.paddingSmall / 2,
                    ),
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
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  );
                }
                if ((index - 6) < _firstDayOffset) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppLayout.paddingSmall / 2,
                    ),
                    child: Center(
                      child: Text(
                        "${_preMonthDays - _firstDayOffset + index - 6}",
                        style: TextStyle(color: AppColor.hintColor),
                      ),
                    ),
                  );
                }
                if (index >= _monthDays + 6 + _firstDayOffset) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppLayout.paddingSmall / 2,
                    ),
                    child: Center(
                      child: Text(
                        "${index - 5 - _monthDays - _firstDayOffset}",
                        style: TextStyle(color: AppColor.hintColor),
                      ),
                    ),
                  );
                }

                DateTime itemDateTime = DateTime(
                  _dateTime.year,
                  _dateTime.month,
                  index - _firstDayOffset - 5,
                );

                DateTime? rangeStart;
                DateTime? rangeEnd;

                if (_secondTime != null) {
                  if (_dateTime.isBefore(_secondTime!)) {
                    rangeStart = _dateTime;
                    rangeEnd = _secondTime;
                  } else {
                    rangeStart = _secondTime;
                    rangeEnd = _dateTime;
                  }
                }

                bool isRangeStart =
                    rangeStart != null &&
                    itemDateTime.isAtSameMomentAs(rangeStart);
                bool isRangeEnd =
                    rangeEnd != null && itemDateTime.isAtSameMomentAs(rangeEnd);
                bool isInRange =
                    rangeStart != null &&
                    itemDateTime.isAfter(rangeStart) &&
                    itemDateTime.isBefore(rangeEnd!);

                return DateItem(
                  itemDateTime: itemDateTime,
                  isRangeStart: isRangeStart,
                  isRangeEnd: isRangeEnd,
                  isInRange: isInRange,
                  isSelected:
                      _dateTime == itemDateTime || _secondTime == itemDateTime,
                  isHovered: _hoveredDate == itemDateTime,
                  onHover: (date) => setState(() => _hoveredDate = date),
                  onExit: () => setState(() => _hoveredDate = null),
                  onTap: (date) => setState(() {
                    _dateTime = date;
                    _secondTime = null; // 重置范围
                  }),
                  onLongPress: (date) => setState(() => _secondTime = date),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DateItem extends StatelessWidget {
  final DateTime itemDateTime;
  final bool isRangeStart;
  final bool isRangeEnd;
  final bool isInRange;
  final bool isSelected;
  final bool isHovered;
  final Function(DateTime) onHover;
  final VoidCallback onExit;
  final Function(DateTime) onTap;
  final Function(DateTime) onLongPress;

  const DateItem({
    super.key,
    required this.itemDateTime,
    required this.isRangeStart,
    required this.isRangeEnd,
    required this.isInRange,
    required this.isSelected,
    required this.isHovered,
    required this.onHover,
    required this.onExit,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    bool highlight = isRangeStart || isRangeEnd || isInRange;
    Color activeColor = const Color(0xff15C0E6);

    return MouseRegion(
      onHover: (event) => onHover(itemDateTime),
      onExit: (event) => onExit(),
      child: GestureDetector(
        onTap: () => onTap(itemDateTime),
        onLongPress: () => onLongPress(itemDateTime),
        child: Container(
          decoration: BoxDecoration(
            color: highlight ? activeColor : Colors.transparent,
            borderRadius: (isRangeStart && isRangeEnd)
                ? BorderRadius.circular(AppLayout.borderRadius / 2)
                : isRangeStart
                ? BorderRadius.horizontal(
                    left: Radius.circular(AppLayout.borderRadius / 2),
                  )
                : isRangeEnd
                ? BorderRadius.horizontal(
                    right: Radius.circular(AppLayout.borderRadius / 2),
                  )
                : BorderRadius.zero,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppLayout.paddingSmall / 2,
            ),
            decoration: BoxDecoration(
              color: isSelected ? activeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(AppLayout.borderRadius / 2),
              border: isHovered && !isSelected
                  ? Border.all(color: Colors.black, width: 1.5)
                  : null,
            ),
            child: Center(
              child: Text(
                "${itemDateTime.day}",
                style: TextStyle(
                  color: highlight || isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected || highlight
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
