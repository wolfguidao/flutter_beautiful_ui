import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_label_widget.dart';
import 'package:flutter/material.dart';

class ProjectsTaskInfo extends StatefulWidget {
  final double width;
  final Task task;
  const ProjectsTaskInfo({super.key, required this.width, required this.task});

  @override
  State<ProjectsTaskInfo> createState() => _ProjectsTaskInfoState();
}

class _ProjectsTaskInfoState extends State<ProjectsTaskInfo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(20.0 * (1 - _animation.value), 0),
          child: Opacity(opacity: _animation.value, child: child),
        );
      },
      child: Container(
        width: widget.width * 0.2,
        padding: AppLayout.paddingSmall.allPadding,
        decoration: BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.circular(AppLayout.borderRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Task Info", style: TextTheme.of(context).bodyMedium),
            AppLayout.paddingLarge.heightBox,
            CusLabelWidget(
              label: "Reporter",
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(widget.task.reporter.avatar, width: 20),
                  ),
                  (AppLayout.paddingSmall * 0.5).widthBox,
                  Text(
                    widget.task.reporter.name,
                    style: TextTheme.of(context).bodySmall,
                  ),
                ],
              ),
            ),
            AppLayout.paddingLarge.heightBox,
            CusLabelWidget(
              label: "Assigned",
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(widget.task.assignee.avatar, width: 20),
                  ),
                  (AppLayout.paddingSmall * 0.5).widthBox,
                  Text(
                    widget.task.assignee.name,
                    style: TextTheme.of(context).bodySmall,
                  ),
                ],
              ),
            ),
            AppLayout.paddingLarge.heightBox,
            CusLabelWidget(
              label: "Priority",
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_upward,
                    size: 15,
                    color: widget.task.priority.color,
                  ),
                  (AppLayout.paddingSmall * 0.5).widthBox,
                  Text(
                    widget.task.priority.text,
                    style: TextStyle(color: widget.task.priority.color),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: AppLayout.paddingSmall.allPadding,
              margin: AppLayout.paddingSmall.verticalPadding,
              decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Time tracking"),
                  Padding(
                    padding: AppLayout.paddingMedium.verticalPadding,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            value: widget.task.progress,
                          ),
                        ),
                        AppLayout.paddingSmall.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Spent Time ${widget.task.spentTime} h",
                              style: TextStyle(
                                fontSize: TextTheme.of(
                                  context,
                                ).labelMedium?.fontSize,
                              ),
                            ),
                            Text(
                              "Original Estimated ${widget.task.estimateTime} h",
                              style: TextTheme.of(context).labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(100, 40),
                      maximumSize: Size(100, 40),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.access_time_rounded),
                        (AppLayout.paddingSmall / 2).widthBox,
                        Text(
                          "Log Time",
                          style: TextStyle(
                            fontSize: TextTheme.of(
                              context,
                            ).labelMedium?.fontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CusLabelWidget(
              label: "Dead Line",
              child: Text(
                widget.task.deadline.fullDate,
                style: TextTheme.of(context).bodySmall,
              ),
            ),
            Padding(
              padding: AppLayout.paddingLarge.verticalPadding,
              child: Row(
                children: [
                  Icon(Icons.calendar_month, size: 20),
                  (AppLayout.paddingSmall / 2).widthBox,
                  Expanded(
                    child: Text(
                      "Created ${widget.task.createTime.fullDate}",
                      style: TextTheme.of(context).labelMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
