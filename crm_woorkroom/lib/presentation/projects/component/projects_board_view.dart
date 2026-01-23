import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/presentation/projects/widgets/task_drag_area.dart';
import 'package:flutter/material.dart';

class ProjectsBoardView extends StatefulWidget {
  final Project project;
  const ProjectsBoardView({super.key, required this.project});

  @override
  State<ProjectsBoardView> createState() => _ProjectsBoardViewState();
}

class _ProjectsBoardViewState extends State<ProjectsBoardView> {
  @override
  void initState() {
    super.initState();
  }

  Task? _draggingTask;

  List<Task> _getFilteredTasks(TaskType type) {
    return widget.project.tasks.where((e) => e.taskType == type).toList();
  }

  void _handleTaskMove(Task task, TaskStatus newStatus, TaskType newType) {
    setState(() {
      task.taskStatus = newStatus;
      task.taskType = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                actionsPadding: EdgeInsets.zero,
                titleSpacing: 0,
                backgroundColor: AppColor.backgroundColor,
                surfaceTintColor: AppColor.backgroundColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(TaskStatus.values.length, (index) {
                    return Center(
                      child: Container(
                        padding: (AppLayout.paddingSmall * 0.7).allPadding,
                        width: width * 0.225,
                        decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          border: Border.all(
                            color: AppColor.secondColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppLayout.borderRadius * 3,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            TaskStatus.values[index].text,
                            style: TextTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
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
                      "Active Tasks",
                      style: TextTheme.of(context).displaySmall,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: TaskDragArea(
                  draggingTask: _draggingTask,
                  tasks: _getFilteredTasks(TaskType.active),
                  taskType: TaskType.active,
                  width: width,
                  onDragStarted: (task) => setState(() => _draggingTask = task),
                  onDragEnd: () => setState(() => _draggingTask = null),
                  onTaskDropped: (task, status, taskType) =>
                      _handleTaskMove(task, status, taskType),
                ),
              ),
              SliverToBoxAdapter(child: AppLayout.paddingSmall.heightBox),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  padding: AppLayout.paddingSmall.verticalPadding,
                  decoration: BoxDecoration(
                    color: Color(0xffE6EDF5),
                    borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Backlog",
                          style: TextTheme.of(context).displaySmall,
                        ),
                        AppLayout.paddingSmall.heightBox,
                        TaskDragArea(
                          tasks: _getFilteredTasks(TaskType.backlog),
                          taskType: TaskType.backlog,
                          width: width,
                          draggingTask: _draggingTask,
                          onDragStarted: (task) =>
                              setState(() => _draggingTask = task),
                          onDragEnd: () => setState(() => _draggingTask = null),
                          onTaskDropped: (task, status, taskType) =>
                              _handleTaskMove(task, status, taskType),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
