import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_animated_switch.dart';
import 'package:flutter/material.dart';

class EmployeesHeader extends StatefulWidget {
  final List<String> views;
  final String activeType;
  final ValueChanged<String> onChanged;
  const EmployeesHeader({
    super.key,
    required this.views,
    required this.activeType,
    required this.onChanged,
  });

  @override
  State<EmployeesHeader> createState() => _EmployeesHeaderState();
}

class _EmployeesHeaderState extends State<EmployeesHeader> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Employees(${AppMock.userList.length})",
              style: TextTheme.of(context).displayMedium,
            ),
            CusAnimatedSwitch(
              width: width * 0.32,
              items: widget.views,
              active: widget.activeType,
              onChanged: (value) => widget.onChanged(value),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list_outlined, size: 20),
                ),
                AppLayout.paddingSmall.widthBox,
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 15),
                      Text(
                        "Add Employee",
                        style: TextStyle(
                          fontSize: TextTheme.of(context).labelMedium?.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
