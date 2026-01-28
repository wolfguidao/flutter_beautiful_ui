import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_animated_delay_item.dart';
import 'package:flutter/material.dart';

class EmployeesActivity extends StatefulWidget {
  final ValueChanged<Employee> onTap;
  const EmployeesActivity({super.key, required this.onTap});

  @override
  State<EmployeesActivity> createState() => _EmployeesActivityState();
}

class _EmployeesActivityState extends State<EmployeesActivity> {
  final List<String> _taskTypes = ["Backlog", "Progress", "Review"];
  final Map<Employee, Map<String, dynamic>> _userTaskCount = {};
  int _page = 0;
  final int _pageSize = 10;

  @override
  void initState() {
    for (var project in AppMock.projectList) {
      final employee = project.reporter;
      if (!_userTaskCount.containsKey(employee)) {
        _userTaskCount[employee] = {
          "Backlog": 0,
          "Progress": 0,
          "Review": 0,
          "totalP": 0.0,
          "count": 0,
        };
      }
      var s = _userTaskCount[employee]!;
      s["Backlog"] += project.backlogTasks;
      s["Progress"] += project.progressTasks;
      s["Review"] += project.reviewTasks;
      s["totalP"] += project.averageProgress;
      s["count"] += 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Employee> pagedUsers = AppMock.userList
        .skip(_page * _pageSize)
        .take(_pageSize)
        .toList();
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  children: pagedUsers.asMap().entries.map((entry) {
                    int index = entry.key;
                    var user = entry.value;
                    double progress =
                        (_userTaskCount[user]?["totalP"] ?? 1) /
                        (_userTaskCount[user]?["count"] ?? 1);
                    return CusAnimatedDelayItem(
                      key: ValueKey(user),
                      index: index,
                      child: GestureDetector(
                        onTap: () => widget.onTap(user),
                        child: Container(
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
                                          style: TextTheme.of(
                                            context,
                                          ).labelSmall,
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
                                        Text(
                                          "${_userTaskCount[user]?[type] ?? 0}",
                                        ),
                                        Text(
                                          type,
                                          style: TextTheme.of(
                                            context,
                                          ).labelSmall,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
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
                      Text(
                        "${_page * _pageSize + 1}-${(_page + 1) * _pageSize} of ${AppMock.userList.length}",
                      ),
                      AppLayout.paddingSmall.widthBox,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _page -= 1;
                          });
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 15,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _page += 1;
                          });
                        },
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
