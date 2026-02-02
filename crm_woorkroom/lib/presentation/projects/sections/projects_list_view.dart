import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/presentation/projects/widgets/task_list_item.dart';
import 'package:flutter/material.dart';

class ProjectsListView extends StatefulWidget {
  final Project project;
  final ValueChanged onTapTask;
  const ProjectsListView({
    super.key,
    required this.project,
    required this.onTapTask,
  });

  @override
  State<ProjectsListView> createState() => _ProjectsListViewState();
}

class _ProjectsListViewState extends State<ProjectsListView> {
  late List<Task> _activeTask = [];
  late List<Task> _backlogTask = [];

  @override
  void initState() {
    _activeTask = widget.project.tasks
        .where((e) => e.taskType == TaskType.active)
        .toList();
    _backlogTask = widget.project.tasks
        .where((e) => e.taskType == TaskType.backlog)
        .toList();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProjectsListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.project != widget.project) {
      setState(() {
        _activeTask = widget.project.tasks
            .where((e) => e.taskType == TaskType.active)
            .toList();
        _backlogTask = widget.project.tasks
            .where((e) => e.taskType == TaskType.backlog)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 30,
            actionsPadding: EdgeInsets.zero,
            titleSpacing: 0,
            backgroundColor: AppColor.backgroundColor,
            title: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffE6EDF5),
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
              ),
              child: Center(
                child: Text(
                  "Active Tasks",
                  style: TextTheme.of(context).displaySmall,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: AppLayout.paddingSmall.heightBox),
          SliverList.builder(
            itemCount: _activeTask.length,
            itemBuilder: (context, index) {
              final Task task = _activeTask[index];
              return GestureDetector(
                onTap: () => widget.onTapTask(task),
                child: TaskListItem(task: task),
              );
            },
          ),
          SliverAppBar(
            toolbarHeight: 30,
            actionsPadding: EdgeInsets.zero,
            titleSpacing: 0,
            backgroundColor: AppColor.backgroundColor,
            title: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffE6EDF5),
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
              ),
              child: Center(
                child: Text(
                  "Backlog",
                  style: TextTheme.of(context).displaySmall,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: AppLayout.paddingSmall.heightBox),
          SliverList.builder(
            itemCount: _backlogTask.length,
            itemBuilder: (context, index) {
              final Task task = _backlogTask[index];
              return GestureDetector(
                onTap: () => widget.onTapTask(task),
                child: TaskListItem(task: task),
              );
            },
          ),
        ],
      ),
    );
  }
}
