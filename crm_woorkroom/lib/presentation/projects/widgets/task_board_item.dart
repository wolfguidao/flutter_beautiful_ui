import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:flutter/material.dart';

class TaskBoardItem extends StatelessWidget {
  final Task task;
  final double width;
  final VoidCallback? onDragStarted;
  final VoidCallback? onDragEnd;
  const TaskBoardItem({
    super.key,
    required this.task,
    required this.width,
    this.onDragStarted,
    this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Draggable<Task>(
        onDragStarted: ()=>onDragStarted?.call(),
        onDragEnd: (_)=>onDragEnd?.call(),
        data: task,
        feedback: TaskBoardItem(task: task, width: width,),
        childWhenDragging: Opacity(
          opacity: 0.25,
          child: TaskBoardItem(task: task, width: width),
        ),
        child: Container(
          padding: (AppLayout.paddingSmall * 0.7).allPadding,
          margin: EdgeInsets.only(top: AppLayout.paddingSmall),
          width: width * 0.225,
          decoration: BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.id, style: TextTheme.of(context).labelSmall),
              Text(
                task.name,
                style: TextStyle(
                  fontSize: TextTheme.of(context).labelMedium?.fontSize,
                ),
              ),
              AppLayout.paddingLarge.heightBox,
              Row(
                children: [
                  Container(
                    padding: (AppLayout.paddingSmall * 0.2).allPadding,
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius: BorderRadius.circular(
                        AppLayout.paddingSmall / 2,
                      ),
                    ),
                    child: Text(
                      task.estimate,
                      style: TextTheme.of(context).labelSmall,
                    ),
                  ),
                  AppLayout.paddingSmall.widthBox,
                  Icon(
                    Icons.arrow_upward,
                    size: 12,
                    color: task.taskStatus.color,
                  ),
                  Spacer(),
                  ClipOval(
                    child: Image.asset(task.assignee[0].avatar, width: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
