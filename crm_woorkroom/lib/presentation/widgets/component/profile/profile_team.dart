import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_circle_avatar.dart';
import 'package:flutter/material.dart';

class ProfileTeam extends StatefulWidget {
  final Employee employee;
  const ProfileTeam({super.key, required this.employee});

  @override
  State<ProfileTeam> createState() => _ProfileTeamState();
}

class _ProfileTeamState extends State<ProfileTeam> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: Wrap(
          children: widget.employee.teamMember.map((user) {
            late double averageProgress;
            final List<Project> projectList = AppMock.projectList
                .where((e) => e.reporter == widget.employee)
                .toList();
            if (projectList.isEmpty) {
              averageProgress = 1.0;
            } else {
              double totalProgress = 0.0;
              for (Project project in projectList) {
                totalProgress += project.averageProgress;
              }
              averageProgress = totalProgress / projectList.length;
            }
            return Container(
              width: 150,
              padding: AppLayout.paddingSmall.allPadding,
              margin: AppLayout.paddingSmall.allPadding,
              decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: Stack(
                      alignment: AlignmentGeometry.center,
                      children: [
                        CusCircleAvatar(avatar: user.avatar, size: 40),
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: CircularProgressIndicator(
                            value: averageProgress,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppLayout.paddingSmall.heightBox,
                  Text(user.name),
                  Text(user.position, style: TextTheme.of(context).labelSmall),
                  AppLayout.paddingSmall.heightBox,
                  Container(
                    padding: 2.allPadding,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.borderColor),
                      borderRadius: BorderRadius.circular(
                        AppLayout.borderRadius / 2,
                      ),
                    ),
                    child: Text(
                      user.lever,
                      style: TextTheme.of(context).labelSmall,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
