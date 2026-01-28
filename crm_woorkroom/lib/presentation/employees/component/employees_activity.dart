import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:flutter/material.dart';

class EmployeesActivity extends StatefulWidget {
  const EmployeesActivity({super.key});

  @override
  State<EmployeesActivity> createState() => _EmployeesActivityState();
}

class _EmployeesActivityState extends State<EmployeesActivity> {
  final List<String> _taskTypes = ["Backlog", "Progress", "Review"];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  children: AppMock.userList.take(8).map((user) {
                    int index = AppMock.projectList.indexWhere(
                      (e) => e.reporter == user,
                    );
                    Map<String, int> taskCount = {
                      "Backlog": 0,
                      "Progress": 0,
                      "Review": 0,
                    };
                    double progress = 1.0;
                    if (index != -1) {
                      Project project = AppMock.projectList[index];
                      taskCount["Backlog"] = project.tasks
                          .where((e) => e.taskType == TaskType.backlog)
                          .length;
                      taskCount["Progress"] = project.tasks
                          .where((e) => e.taskStatus == TaskStatus.progress)
                          .length;
                      taskCount["Review"] = project.tasks
                          .where((e) => e.taskStatus == TaskStatus.review)
                          .length;
                      progress = project.averageProgress;
                    }
                    return Container(
                      width: 165,
                      padding: AppLayout.paddingSmall.allPadding,
                      margin: EdgeInsets.only(
                        right: AppLayout.paddingSmall,
                        bottom: AppLayout.paddingSmall,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.secondColor,
                        borderRadius: BorderRadius.circular(
                          AppLayout.borderRadius,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: AppLayout.paddingSmall.allPadding,
                            decoration: BoxDecoration(
                              color: AppColor.backgroundColor,
                              borderRadius: BorderRadius.circular(
                                AppLayout.borderRadius,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Stack(
                                    alignment: AlignmentGeometry.center,
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          user.avatar,
                                          width: 30,
                                        ),
                                      ),
                                      CircularProgressIndicator(
                                        value: progress,
                                      ),
                                    ],
                                  ),
                                ),
                                AppLayout.paddingSmall.heightBox,
                                Text(user.name),
                                Text(
                                  user.position,
                                  style: TextTheme.of(context).labelSmall,
                                ),
                                AppLayout.paddingSmall.heightBox,
                                Container(
                                  width: 50,
                                  padding: 2.allPadding,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppLayout.borderRadius / 2,
                                    ),
                                    border: Border.all(
                                      color: AppColor.borderColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      user.lever,
                                      style: TextTheme.of(context).labelSmall,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppLayout.paddingMedium.heightBox,
                          Row(
                            children: _taskTypes.map((type) {
                              return Expanded(
                                child: Column(
                                  children: [
                                    Text("${taskCount[type]}"),
                                    Text(
                                      type,
                                      style: TextTheme.of(context).labelSmall,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Align(
                alignment: AlignmentGeometry.bottomRight,
                child: Container(
                  width: 140,
                  padding: AppLayout.paddingSmall.allPadding,
                  decoration: BoxDecoration(
                    color: AppColor.secondColor,
                    borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("1-8 of ${AppMock.userList.length}"),
                      AppLayout.paddingSmall.widthBox,
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_back,
                          size: 15,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_forward,
                          size: 15,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
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
