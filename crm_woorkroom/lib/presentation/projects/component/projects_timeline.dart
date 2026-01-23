import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/presentation/projects/widgets/task_timeline.dart';
import 'package:crm_woorkroom/presentation/projects/widgets/task_timeline_bar.dart';
import 'package:flutter/material.dart';

class ProjectsTimeline extends StatefulWidget {
  final Project project;
  const ProjectsTimeline({super.key, required this.project});

  @override
  State<ProjectsTimeline> createState() => _ProjectsTimelineState();
}

class _ProjectsTimelineState extends State<ProjectsTimeline> {
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
                taskList: widget.project.tasks.take(14).toList(),
              ),
              Expanded(
                child: TaskTimeline(
                  taskList: widget.project.tasks.take(14).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
