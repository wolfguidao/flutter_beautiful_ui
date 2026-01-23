import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:flutter/material.dart';

class TaskTimelineBar extends StatelessWidget {
  final double width;
  final List<Task> taskList;
  const TaskTimelineBar({
    super.key,
    required this.width,
    required this.taskList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.2,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: Color(0xffE6EBF5))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: AppLayout.paddingSmall.allPadding,
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xffE6EBF5))),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("All Tasks", style: TextTheme.of(context).bodyMedium),
                Text(
                  "${taskList.length} tasks",
                  style: TextTheme.of(context).labelSmall,
                ),
              ],
            ),
          ),
          ...taskList.map((task) {
            return Container(
              height: 40,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: AppLayout.paddingSmall,
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xffE6EBF5))),
              ),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  task.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: TextTheme.of(context).labelMedium?.fontSize,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
