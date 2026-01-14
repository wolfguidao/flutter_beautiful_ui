import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/constant/app_data.dart';
import 'package:saas_dashboard/entity/schedule/task.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';

class ScheduleTimelineView extends StatefulWidget {
  const ScheduleTimelineView({super.key});

  @override
  State<ScheduleTimelineView> createState() => _ScheduleTimelineViewState();
}

class _ScheduleTimelineViewState extends State<ScheduleTimelineView> {
  final Map<String, List<Task>> _taskMap = {
    "To Do": todoList,
    "Doing": doingList,
    "Done": doneList,
  };

  String _activeType = "To Do";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width * 0.2,
                  padding: EdgeInsets.all(AppConstrain.paddingSmall * 0.8),
                  margin: EdgeInsets.only(bottom: AppConstrain.paddingSmall),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffEFEFFF)),
                    borderRadius: BorderRadius.circular(
                      AppConstrain.borderRadius,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("December 2021", style: TextStyle(fontSize: 11)),
                      SvgPicture.asset(
                        Assets.images.arrow,
                        colorFilter: ColorFilter.mode(
                          Color(0xffC9C8D1),
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: width * 0.2,
                    padding: EdgeInsets.all(AppConstrain.paddingSmall),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(
                        AppConstrain.borderRadius,
                      ),
                    ),
                    child: Column(
                      children: [
                        ...List.generate(_taskMap.length, (index) {
                          final String key = _taskMap.keys.elementAt(index);
                          return Container(
                            padding: EdgeInsets.all(
                              AppConstrain.paddingSmall * 0.8,
                            ),
                            margin: EdgeInsets.only(
                              bottom: AppConstrain.paddingSmall,
                            ),
                            decoration: BoxDecoration(
                              color: _activeType == key
                                  ? AppColors.secondColor
                                  : AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(
                                AppConstrain.borderRadius,
                              ),
                              border: Border.all(
                                color: _activeType == key
                                    ? AppColors.secondColor
                                    : Color(0xffEFEFFF),
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentGeometry.centerLeft,
                              child: Text(
                                key,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: _activeType == key
                                      ? AppColors.primaryColor
                                      : Colors.black,
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: width * 0.78,
              height: height,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
              ),
            ),
          ],
        );
      },
    );
  }
}
