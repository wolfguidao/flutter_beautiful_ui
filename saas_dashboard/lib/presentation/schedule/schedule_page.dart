import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/presentation/schedule/component/schedule_board_view.dart';
import 'package:saas_dashboard/presentation/schedule/component/schedule_list_view.dart';
import 'package:saas_dashboard/presentation/schedule/component/schedule_timeline_view.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final List<String> _viewType = ["List", "Board", "Timeline"];
  final List<Widget> _views = [
    ScheduleListView(),
    ScheduleBoardView(),
    ScheduleTimelineView(),
  ];
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Task Preview", style: TextTheme.of(context).titleMedium),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 15),
                      Text("Add Task", style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstrain.paddingSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(
                      AppConstrain.borderRadius / 2,
                    ),
                  ),
                  child: Row(
                    children: List.generate(_viewType.length, (index) {
                      final bool isActive = _activeIndex == index;
                      late BorderRadius borderRadius;
                      if (index == 0) {
                        borderRadius = BorderRadius.only(
                          topLeft: Radius.circular(
                            AppConstrain.borderRadius / 2,
                          ),
                          bottomLeft: Radius.circular(
                            AppConstrain.borderRadius / 2,
                          ),
                        );
                      } else if (index == _viewType.length - 1) {
                        borderRadius = BorderRadius.only(
                          topRight: Radius.circular(
                            AppConstrain.borderRadius / 2,
                          ),
                          bottomRight: Radius.circular(
                            AppConstrain.borderRadius / 2,
                          ),
                        );
                      } else {
                        borderRadius = BorderRadius.zero;
                      }
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppConstrain.paddingSmall,
                            vertical: AppConstrain.paddingSmall / 2,
                          ),
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.secondColor
                                : AppColors.primaryColor,
                            borderRadius: borderRadius,
                          ),
                          child: Text(
                            _viewType[index],
                            style: TextStyle(
                              fontSize: 11,
                              color: isActive
                                  ? AppColors.primaryColor
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  width: width * 0.2,
                  child: TextField(
                    style: TextStyle(fontSize: 11),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontSize: 11,
                        color: Color(0xff818094),
                      ),
                      fillColor: AppColors.primaryColor,
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstrain.paddingSmall),
            Expanded(child: _views[_activeIndex]),
          ],
        );
      },
    );
  }
}
