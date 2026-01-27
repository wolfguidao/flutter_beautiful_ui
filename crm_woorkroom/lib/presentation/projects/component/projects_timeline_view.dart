import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/presentation/projects/widgets/task_timeline.dart';
import 'package:crm_woorkroom/presentation/projects/widgets/task_timeline_bar.dart';
import 'package:flutter/material.dart';

class ProjectsTimelineView extends StatelessWidget {
  final Project project;
  final ValueChanged onTapTask;
  const ProjectsTimelineView({
    super.key,
    required this.project,
    required this.onTapTask,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Container(
          decoration: BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          ),
          child: Row(
            children: [
              TaskTimelineBar(
                width: width,
                taskList: AppMock.taskList.take(14).toList(),
                onTapTask: onTapTask,
              ),
              Expanded(
                child: TaskTimeline(
                  taskList: AppMock.taskList.take(14).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
