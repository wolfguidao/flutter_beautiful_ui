import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_avatar_group.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CusProjectCard extends StatelessWidget {
  final Project project;
  const CusProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppLayout.paddingSmall),
      decoration: BoxDecoration(
        color: AppColor.secondColor,
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: AppLayout.paddingSmall.allPadding,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Color(0xffE4E6E8), width: 0.5),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(project.icon, width: 25),
                      AppLayout.paddingSmall.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.id,
                            style: TextTheme.of(context).labelSmall,
                          ),
                          Text(project.name),
                        ],
                      ),
                    ],
                  ),
                  AppLayout.paddingSmall.heightBox,
                  Row(
                    children: [
                      Icon(Icons.calendar_month, size: 15),
                      Text(
                        "Created ${project.createTime}",
                        style: TextTheme.of(context).labelMedium,
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_upward,
                        color: project.priority.color,
                        size: 15,
                      ),
                      Text(
                        project.priority.text,
                        style: TextStyle(color: project.priority.color),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: AppLayout.paddingSmall.allPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Project Data"),
                  (AppLayout.paddingSmall / 2).heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: CusLabelWidget(
                          label: "All Tasks",
                          child: Text(project.tasks.length.toString()),
                        ),
                      ),
                      Expanded(
                        child: CusLabelWidget(
                          label: "All Tasks",
                          child: Text(
                            project.tasks
                                .where((e) => e.taskType == TaskType.active)
                                .toList()
                                .length
                                .toString(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CusLabelWidget(
                          label: "Assignees",
                          child: CusAvatarGroup(
                            employeeList: project.allAssignee,
                            height: 20,
                            displayNumber: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
