import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/employees/component/employees_activity.dart';
import 'package:crm_woorkroom/presentation/employees/component/employees_header.dart';
import 'package:crm_woorkroom/presentation/employees/component/employees_listview.dart';
import 'package:flutter/material.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  final Map<String, Widget> _views = {
    "List": EmployeesListview(),
    "Activity": EmployeesActivity(),
  };

  String _activeType = "List";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmployeesHeader(
          views: _views,
          activeType: _activeType,
          onChanged: (value) {
            setState(() {
              _activeType = value;
            });
          },
        ),
        AppLayout.paddingSmall.heightBox,
        Expanded(child: _views[_activeType] ?? SizedBox.shrink()),
      ],
    );
  }
}
