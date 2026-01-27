import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/vacations/component/vacations_calendar.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double totalWidth = width * 0.32;
        final double horizontalPadding = AppLayout.paddingSmall * 0.3;
        final double trackWidth = totalWidth - (horizontalPadding * 2);
        final double itemWidth = trackWidth / _views.length;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Vacations", style: TextTheme.of(context).displayMedium),
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
                            _views.keys.toList().indexOf(_activeType) *
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
                        children: _views.entries.map((type) {
                          return Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => _activeType = type.key),
                              child: Center(
                                child: Text(
                                  type.key,
                                  style: TextStyle(
                                    fontSize: TextTheme.of(
                                      context,
                                    ).labelMedium?.fontSize,
                                    color: _activeType == type.key
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
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 15),
                      Text(
                        "Add Request",
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
            Expanded(child: _views[_activeType]??SizedBox.shrink()),
          ],
        );
      },
    );
  }
}
