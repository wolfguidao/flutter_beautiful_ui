import 'package:crm_woorkroom/presentation/calendar/widgets/add_event_dialog.dart';
import 'package:flutter/material.dart';

class CalendarHeader extends StatefulWidget {
  const CalendarHeader({super.key});

  @override
  State<CalendarHeader> createState() => _CalendarHeaderState();
}

class _CalendarHeaderState extends State<CalendarHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Calendar", style: TextTheme.of(context).displayMedium),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddEventDialog();
              },
            );
          },
          child: Row(
            children: [
              Icon(Icons.add, size: 15),
              Text(
                "Add Event",
                style: TextStyle(
                  fontSize: TextTheme.of(context).labelMedium?.fontSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
