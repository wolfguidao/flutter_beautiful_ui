import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:flutter/material.dart';

class ProjectsTaskDetails extends StatefulWidget {
  final Task task;
  const ProjectsTaskDetails({super.key, required this.task});

  @override
  State<ProjectsTaskDetails> createState() => _ProjectsTaskDetailsState();
}

class _ProjectsTaskDetailsState extends State<ProjectsTaskDetails>
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
          offset: Offset(0, 20.0 * (1 - _animation.value)),
          child: Opacity(opacity: _animation.value, child: child),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Task Detail", style: TextTheme.of(context).displaySmall),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.secondColor,
                ),
                onPressed: () {},
                icon: Icon(Icons.edit_note_outlined, size: 20),
              ),
            ],
          ),
          AppLayout.paddingSmall.heightBox,
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.secondColor,
                    borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: AppLayout.paddingSmall.allPadding,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: AppColor.borderColor),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.task.id,
                              style: TextTheme.of(context).labelMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.task.name),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppLayout.paddingSmall / 2,
                                    horizontal: AppLayout.paddingSmall,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        widget.task.taskStatus.backgroundColor,
                                    borderRadius: BorderRadius.circular(
                                      AppLayout.borderRadius / 2,
                                    ),
                                  ),
                                  child: Text(
                                    widget.task.taskStatus.text,
                                    style: TextStyle(
                                      color: widget.task.taskStatus.color,
                                      fontSize: TextTheme.of(
                                        context,
                                      ).labelMedium?.fontSize,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AppLayout.paddingSmall.heightBox,
                            Text(
                              widget.task.description,
                              style: TextTheme.of(context).labelMedium,
                            ),
                            Padding(
                              padding: AppLayout.paddingSmall.verticalPadding,
                              child: Text(
                                "Task Attachments(${widget.task.attachments.length})",
                              ),
                            ),
                            Wrap(
                              children: widget.task.attachments.map((value) {
                                return Stack(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      margin: EdgeInsets.only(
                                        right: AppLayout.paddingSmall,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          AppLayout.borderRadius,
                                        ),
                                      ),
                                      foregroundDecoration: BoxDecoration(
                                        color: Colors.black.withAlpha(20),
                                        borderRadius: BorderRadius.circular(
                                          AppLayout.borderRadius,
                                        ),
                                      ),
                                      child: Image.asset(
                                        value.url,
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      left: 5,
                                      right: 15,
                                      child: Container(
                                        padding: (AppLayout.paddingSmall / 2)
                                            .allPadding,
                                        decoration: BoxDecoration(
                                          color: AppColor.secondColor,
                                          borderRadius: BorderRadius.circular(
                                            AppLayout.borderRadius,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: TextTheme.of(
                                                  context,
                                                ).labelSmall?.fontSize,
                                              ),
                                            ),
                                            Text(
                                              value.uploadTime.fullDate,
                                              style: TextTheme.of(
                                                context,
                                              ).labelSmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: AppLayout.paddingSmall.allPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recent Activity",
                              style: TextTheme.of(context).bodyMedium,
                            ),
                            AppLayout.paddingMedium.heightBox,
                            ...widget.task.activityList.take(2).map((activity) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          activity.avatar,
                                          width: 30,
                                        ),
                                      ),
                                      AppLayout.paddingSmall.widthBox,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(activity.username),
                                          Text(
                                            activity.userRole,
                                            style: TextTheme.of(
                                              context,
                                            ).labelMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  AppLayout.paddingSmall.heightBox,
                                  ...activity.item.map((item) {
                                    return Container(
                                      padding:
                                          AppLayout.paddingSmall.allPadding,
                                      margin: EdgeInsets.only(
                                        bottom: AppLayout.paddingSmall,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.backgroundColor,
                                        borderRadius: BorderRadius.circular(
                                          AppLayout.borderRadius,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            item.iconData,
                                            color: AppColor.primaryColor,
                                            size: 20,
                                          ),
                                          AppLayout.paddingSmall.widthBox,
                                          Text(item.content),
                                        ],
                                      ),
                                    );
                                  }),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
