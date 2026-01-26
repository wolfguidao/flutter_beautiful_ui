import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/calendar/component/calendar_view.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Calendar", style: TextTheme.of(context).displayMedium),
            TextButton(
              onPressed: () {},
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
        ),
        AppLayout.paddingSmall.heightBox,
        Expanded(child: CalendarView())
      ],
    );
  }
}
