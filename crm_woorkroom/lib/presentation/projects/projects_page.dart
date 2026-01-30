import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/presentation/projects/component/projects_bar.dart';
import 'package:crm_woorkroom/presentation/projects/component/projects_detail_bar.dart';
import 'package:crm_woorkroom/presentation/projects/component/projects_task_details.dart';
import 'package:crm_woorkroom/presentation/projects/component/projects_task_info.dart';
import 'package:crm_woorkroom/presentation/projects/component/projects_task_view.dart';
import 'package:crm_woorkroom/presentation/projects/widgets/add_projects_dialog.dart';
import 'package:crm_woorkroom/presentation/projects/widgets/add_task_dialog.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  Project _activeProject = AppMock.projectList[0];
  bool _showProjectDetail = false;
  Task? _activeTask;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          children: [
            _builderHeader(),
            AppLayout.paddingSmall.heightBox,
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _showProjectDetail
                      ? ProjectsDetailBar(width: width, project: _activeProject)
                      : ProjectsBar(
                          width: width,
                          toDetail: () {
                            setState(() {
                              _showProjectDetail = true;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              _showProjectDetail = false;
                              _activeProject = value;
                              _activeTask = null;
                            });
                          },
                        ),
                  AppLayout.paddingSmall.widthBox,
                  Expanded(
                    child: _activeTask == null
                        ? ProjectsTaskView(
                            activeProject: _activeProject,
                            onTapTask: (value) {
                              setState(() {
                                _activeTask = value;
                              });
                            },
                          )
                        : ProjectsTaskDetails(task: _activeTask!),
                  ),
                  if (_activeTask != null) AppLayout.paddingSmall.widthBox,
                  if (_activeTask != null)
                    ProjectsTaskInfo(width: width, task: _activeTask!),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _builderHeader() {
    return AnimatedSwitcher(
      duration: Duration(seconds: 10),
      child: _showProjectDetail
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showProjectDetail = false;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: AppColor.primaryColor,
                            size: 15,
                          ),
                          Text(
                            "Back to Project",
                            style: TextStyle(
                              fontSize: TextTheme.of(
                                context,
                              ).labelMedium?.fontSize,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      _activeProject.name,
                      style: TextTheme.of(context).displayMedium,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AddTaskDialog();
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 15),
                      Text(
                        "Add Task",
                        style: TextStyle(
                          fontSize: TextTheme.of(context).labelMedium?.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Projects", style: TextTheme.of(context).displayMedium),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AddProjectsDialog();
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 15),
                      Text(
                        "Add Project",
                        style: TextStyle(
                          fontSize: TextTheme.of(context).labelMedium?.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
