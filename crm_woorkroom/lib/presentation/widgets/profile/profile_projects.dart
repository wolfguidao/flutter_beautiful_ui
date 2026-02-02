import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_animated_delay_item.dart';
import 'package:crm_woorkroom/presentation/widgets/project_card.dart';
import 'package:flutter/material.dart';

class ProfileProjects extends StatefulWidget {
  final Employee employee;
  const ProfileProjects({super.key, required this.employee});

  @override
  State<ProfileProjects> createState() => _ProfileProjectsState();
}

class _ProfileProjectsState extends State<ProfileProjects> {
  late List<Project> _projectList = [];
  @override
  void initState() {
    _projectList = AppMock.projectList
        .where((e) => e.reporter == widget.employee)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemCount: _projectList.length,
        itemBuilder: (context, index) {
          final Project project = _projectList[index];
          return CusAnimatedDelayItem(
            index: index,
            child: ProjectCard(project: project),
          );
        },
      ),
    );
  }
}
