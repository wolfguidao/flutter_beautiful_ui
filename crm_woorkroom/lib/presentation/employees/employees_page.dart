import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/employees/component/employees_activity.dart';
import 'package:crm_woorkroom/presentation/employees/component/employees_detail.dart';
import 'package:crm_woorkroom/presentation/employees/component/employees_header.dart';
import 'package:crm_woorkroom/presentation/employees/component/employees_listview.dart';
import 'package:flutter/material.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  final List<String> _views = ["List", "Activity"];
  String _activeType = "List";
  Employee? _employee;

  @override
  Widget build(BuildContext context) {
    return _employee == null
        ? Column(
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
              Expanded(
                child: switch (_activeType) {
                  "List" => EmployeesListview(
                    onTap: (value) {
                      setState(() {
                        _employee = value;
                      });
                    },
                  ),
                  "Activity" => EmployeesActivity(
                    onTap: (value) {
                      setState(() {
                        _employee = value;
                      });
                    },
                  ),
                  _ => SizedBox.shrink(),
                },
              ),
            ],
          )
        : EmployeesDetail(
            employee: _employee!,
            onBack: () {
              setState(() {
                _employee = null;
              });
            },
          );
  }
}
