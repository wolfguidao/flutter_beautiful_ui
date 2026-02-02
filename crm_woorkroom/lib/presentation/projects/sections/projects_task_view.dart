import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/projects/sections/projects_board_view.dart';
import 'package:crm_woorkroom/presentation/projects/dialog/projects_filters.dart';
import 'package:crm_woorkroom/presentation/projects/sections/projects_list_view.dart';
import 'package:crm_woorkroom/presentation/projects/sections/projects_timeline_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProjectsTaskView extends StatefulWidget {
  final Project activeProject;
  final ValueChanged onTapTask;
  const ProjectsTaskView({
    super.key,
    required this.activeProject,
    required this.onTapTask,
  });

  @override
  State<ProjectsTaskView> createState() => _ProjectsTaskViewState();
}

class _ProjectsTaskViewState extends State<ProjectsTaskView>
    with SingleTickerProviderStateMixin {
  final List<String> _viewTypes = [
    Assets.images.list,
    Assets.images.board,
    Assets.images.timeline,
  ];

  int _activeType = 0;

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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Task", style: TextTheme.of(context).displayMedium),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(_viewTypes.length, (index) {
                  return Padding(
                    padding: AppLayout.paddingSmall.horizontalPadding,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: _activeType == index
                                ? AppColor.primaryColor
                                : AppColor.secondColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppLayout.borderRadius,
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _activeType = index;
                        });
                      },
                      icon: SvgPicture.asset(
                        _viewTypes[index],
                        colorFilter: ColorFilter.mode(
                          _activeType == index
                              ? AppColor.primaryColor
                              : Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              ProjectsFiltersButton(project: widget.activeProject),
            ],
          ),
          AppLayout.paddingSmall.heightBox,
          Expanded(
            child: switch (_activeType) {
              0 => ProjectsListView(
                project: widget.activeProject,
                onTapTask: (value) => widget.onTapTask(value),
              ),
              1 => ProjectsBoardView(
                project: widget.activeProject,
                onTapTask: (value) => widget.onTapTask(value),
              ),
              2 => ProjectsTimelineView(
                project: widget.activeProject,
                onTapTask: (value) => widget.onTapTask(value),
              ),
              _ => SizedBox.shrink(),
            },
          ),
        ],
      ),
    );
  }
}
