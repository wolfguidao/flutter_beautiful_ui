import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/user.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_label_widget.dart';
import 'package:flutter/material.dart';

class ProjectsDetailBar extends StatefulWidget {
  final Project project;
  final double width;
  const ProjectsDetailBar({
    super.key,
    required this.width,
    required this.project,
  });

  @override
  State<ProjectsDetailBar> createState() => _ProjectsDetailBarState();
}

class _ProjectsDetailBarState extends State<ProjectsDetailBar>
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
          offset: Offset(-20.0 * (1 - _animation.value), 0),
          child: Opacity(opacity: _animation.value, child: child),
        );
      },
      child: Container(
        width: widget.width * 0.2,
        height: double.infinity,
        padding: AppLayout.paddingSmall.allPadding,
        decoration: BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.circular(AppLayout.borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Project Number",
                      style: TextTheme.of(context).labelMedium,
                    ),
                    Text(
                      widget.project.id,
                      style: TextTheme.of(context).bodySmall,
                    ),
                  ],
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColor.backgroundColor,
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.edit_note_outlined, size: 20),
                ),
              ],
            ),
            Padding(
              padding: AppLayout.paddingSmall.verticalPadding,
              child: Text("Description"),
            ),
            Text(
              widget.project.description,
              style: TextTheme.of(context).labelMedium,
            ),
            AppLayout.paddingMedium.heightBox,
            CusLabelWidget(
              label: "Reporter",
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      widget.project.reporter.avatar,
                      width: 20,
                    ),
                  ),
                  (AppLayout.paddingSmall / 2).widthBox,
                  Text(
                    widget.project.reporter.name,
                    style: TextTheme.of(context).bodySmall,
                  ),
                ],
              ),
            ),
            AppLayout.paddingMedium.heightBox,
            CusLabelWidget(
              label: "Assigness",
              child: SizedBox(
                height: 20,
                child: Stack(
                  children: List.generate(widget.project.allReporter.length, (
                    index,
                  ) {
                    final User assignee = widget.project.allReporter[index];
                    return Positioned(
                      left: 12.0 * index,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.secondColor,
                            width: 1.5,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(assignee.avatar, width: 20),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            AppLayout.paddingMedium.heightBox,
            CusLabelWidget(
              label: "Priority",
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_upward,
                    color: widget.project.priority.color,
                    size: 15,
                  ),
                  (AppLayout.paddingSmall / 2).widthBox,
                  Text(
                    widget.project.priority.text,
                    style: TextStyle(color: widget.project.priority.color),
                  ),
                ],
              ),
            ),
            AppLayout.paddingMedium.heightBox,
            Text("Dead Line", style: TextTheme.of(context).labelMedium),
            Text(
              widget.project.deadline,
              style: TextTheme.of(context).bodySmall,
            ),
            Padding(
              padding: AppLayout.paddingLarge.verticalPadding,
              child: Row(
                children: [
                  Icon(Icons.calendar_month, size: 20),
                  (AppLayout.paddingSmall / 2).widthBox,
                  Text(
                    "Created ${widget.project.createTime}",
                    style: TextTheme.of(context).labelMedium,
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
