import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  const TaskListItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppLayout.paddingSmall.allPadding,
      margin: EdgeInsets.only(bottom: AppLayout.paddingSmall),
      decoration: BoxDecoration(
        color: AppColor.secondColor,
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Task Name",
                  style: TextTheme.of(context).labelMedium,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Estimate",
                  style: TextTheme.of(context).labelMedium,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Spent Time",
                  style: TextTheme.of(context).labelMedium,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Assignee",
                  style: TextTheme.of(context).labelMedium,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Priority",
                  style: TextTheme.of(context).labelMedium,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text("", style: TextTheme.of(context).labelMedium),
              ),
              Expanded(
                flex: 1,
                child: Text("", style: TextTheme.of(context).labelMedium),
              ),
            ],
          ),
          (AppLayout.paddingSmall * 0.5).heightBox,
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(task.name, style: TextTheme.of(context).bodyMedium),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "${task.estimateTime}h",
                  style: TextTheme.of(context).bodyMedium,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "${task.spentTime}h",
                  style: TextTheme.of(context).bodyMedium,
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: ClipOval(
                    child: Image.asset(task.assignee.first.avatar,width: 30,),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      size: 12,
                      color: task.priority.color,
                    ),
                    Text(
                      task.priority.text,
                      style: TextStyle(
                        fontSize: TextTheme.of(context).labelMedium?.fontSize,
                        color: task.priority.color,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: (AppLayout.paddingSmall * 0.3).allPadding,
                  decoration: BoxDecoration(
                    color: task.taskStatus.backgroundColor,
                    borderRadius: BorderRadius.circular(
                      AppLayout.borderRadius / 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      task.taskStatus.text,
                      style: TextStyle(
                        fontSize: TextTheme.of(context).labelMedium?.fontSize,
                        color: task.taskStatus.color,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: AlignmentGeometry.center,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(value: task.progress),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
