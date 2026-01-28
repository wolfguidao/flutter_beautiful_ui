import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class EmployeesHeader extends StatefulWidget {
  final Map<String, Widget> views;
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
        final double totalWidth = width * 0.32;
        final double horizontalPadding = AppLayout.paddingSmall * 0.3;
        final double trackWidth = totalWidth - (horizontalPadding * 2);
        final double itemWidth = trackWidth / widget.views.length;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Employees(${AppMock.userList.length})",
              style: TextTheme.of(context).displayMedium,
            ),
            Container(
              width: totalWidth,
              height: 35,
              decoration: BoxDecoration(
                color: Color(0xffE6EDF5),
                borderRadius: BorderRadius.circular(
                  AppLayout.borderRadius * 10,
                ),
              ),
              padding: horizontalPadding.allPadding,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    top: 0,
                    bottom: 0,
                    left:
                        widget.views.keys.toList().indexOf(widget.activeType) *
                        itemWidth,
                    child: Container(
                      width: itemWidth,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(
                          AppLayout.borderRadius * 10,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: widget.views.entries.map((type) {
                      return Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () => widget.onChanged(type.key),
                          child: Center(
                            child: Text(
                              type.key,
                              style: TextStyle(
                                fontSize: TextTheme.of(
                                  context,
                                ).labelMedium?.fontSize,
                                color: widget.activeType == type.key
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
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
