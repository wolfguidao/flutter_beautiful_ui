import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:flutter/material.dart';

class ProjectsBar extends StatefulWidget {
  final double width;
  final VoidCallback toDetail;
  final ValueChanged<Project> onChanged;
  const ProjectsBar({
    super.key,
    required this.width,
    required this.toDetail,
    required this.onChanged,
  });

  @override
  State<ProjectsBar> createState() => _ProjectsBarState();
}

class _ProjectsBarState extends State<ProjectsBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;
  int _activeIndex = 0;

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
        decoration: BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.circular(AppLayout.borderRadius),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppLayout.paddingSmall.allPadding,
                child: Row(
                  children: [
                    Text(
                      "Current Projects",
                      style: TextTheme.of(context).bodyMedium,
                    ),
                    AppLayout.paddingSmall.widthBox,
                    Icon(Icons.keyboard_arrow_down, size: 15),
                  ],
                ),
              ),
              Divider(height: 0),
              ...List.generate(AppMock.projectList.length, (index) {
                final Project project = AppMock.projectList[index];
                final bool isActive = index == _activeIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _activeIndex = index;
                    });
                    widget.onChanged(project);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    padding: (AppLayout.paddingSmall * 0.5).horizontalPadding,
                    margin: EdgeInsets.only(top: AppLayout.paddingSmall * 0.5),
                    decoration: BoxDecoration(
                      border: isActive
                          ? Border(
                              right: BorderSide(
                                color: AppColor.primaryColor,
                                width: AppLayout.borderWidth,
                              ),
                            )
                          : null,
                    ),
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        width: double.infinity,
                        padding: (AppLayout.paddingSmall * 0.8).allPadding,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColor.backgroundColor
                              : AppColor.secondColor,
                          borderRadius: BorderRadius.circular(
                            AppLayout.borderRadius,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.id,
                              style: TextTheme.of(context).labelSmall,
                            ),
                            Text(
                              project.name,
                              style: TextTheme.of(context).bodyMedium,
                            ),
                            if (isActive)
                              GestureDetector(
                                onTap: () => widget.toDetail(),
                                child: Row(
                                  children: [
                                    Text(
                                      "View details",
                                      style: TextStyle(
                                        fontSize: TextTheme.of(
                                          context,
                                        ).labelSmall?.fontSize,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 15,
                                      color: AppColor.primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
