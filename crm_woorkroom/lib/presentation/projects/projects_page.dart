import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/presentation/projects/sections/projects_bar.dart';
import 'package:crm_woorkroom/presentation/projects/sections/projects_detail_bar.dart';
import 'package:crm_woorkroom/presentation/projects/sections/projects_header.dart';
import 'package:crm_woorkroom/presentation/projects/sections/projects_task_details.dart';
import 'package:crm_woorkroom/presentation/projects/sections/projects_task_info.dart';
import 'package:crm_woorkroom/presentation/projects/sections/projects_task_view.dart';
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
            ProjectsHeader(
              showProjectDetail: _showProjectDetail,
              projectName: _activeProject.name,
              onBack: () {
                setState(() {
                  _showProjectDetail = false;
                });
              },
            ),
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
}
