import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/vacations/component/vacations_calendar.dart';
import 'package:crm_woorkroom/presentation/vacations/component/vacations_header.dart';
import 'package:crm_woorkroom/presentation/vacations/component/vacations_listview.dart';
import 'package:flutter/material.dart';

class VacationsPage extends StatefulWidget {
  const VacationsPage({super.key});

  @override
  State<VacationsPage> createState() => _VacationsPageState();
}

class _VacationsPageState extends State<VacationsPage> {
  String _activeType = "Employees'vacations";
  final Map<String, Widget> _views = {
    "Employees'vacations": VacationsListview(),
    "Calendar": VacationsCalendar(),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VacationsHeader(
          views: _views,
          activeType: _activeType,
          onChanged: (value) {
            setState(() => _activeType = value);
          },
        ),
        AppLayout.paddingSmall.heightBox,
        Expanded(child: _views[_activeType] ?? SizedBox.shrink()),
      ],
    );
  }
}
