import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/employees/widgets/employee_detail_bar.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_project_card.dart';
import 'package:flutter/material.dart';

class EmployeesDetail extends StatefulWidget {
  final Employee employee;
  final VoidCallback onBack;
  const EmployeesDetail({
    super.key,
    required this.employee,
    required this.onBack,
  });

  @override
  State<EmployeesDetail> createState() => _EmployeesDetailState();
}

class _EmployeesDetailState extends State<EmployeesDetail> {
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          children: [
            // Header
            Row(
              children: [
                Text(
                  "Employee's Profile",
                  style: TextTheme.of(context).displayMedium,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => widget.onBack(),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: AppColor.primaryColor,
                        size: 15,
                      ),
                      AppLayout.paddingSmall.widthBox,
                      Text(
                        "Back to Employees",
                        style: TextStyle(
                          fontSize: TextTheme.of(context).labelMedium?.fontSize,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppLayout.paddingSmall.heightBox,
            Expanded(
              child: Row(
                children: [
                  // DetailBar
                  EmployeeDetailBar(
                    width: width,
                    employee: widget.employee,
                    projectList: _projectList,
                  ),
                  AppLayout.paddingSmall.widthBox,
                  Expanded(
                    child: Column(
                      children: [
                        // Filter
                        Row(
                          children: [
                            Container(
                              width: width * 0.1,
                              height: 30,
                              padding:
                                  (AppLayout.paddingSmall * 0.3).allPadding,
                              decoration: BoxDecoration(
                                color: Color(0xffE6EDF5),
                                borderRadius: BorderRadius.circular(
                                  AppLayout.borderRadius * 10,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    AppLayout.borderRadius * 10,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Projects",
                                    style: TextStyle(
                                      color: AppColor.secondColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.filter_list_outlined, size: 20),
                            ),
                            AppLayout.paddingSmall.widthBox,
                            Container(
                              padding:
                                  (AppLayout.paddingSmall * 0.6).allPadding,
                              decoration: BoxDecoration(
                                color: AppColor.secondColor,
                                borderRadius: BorderRadius.circular(
                                  AppLayout.borderRadius / 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text("Current Projects"),
                                  Icon(Icons.keyboard_arrow_down, size: 15),
                                ],
                              ),
                            ),
                          ],
                        ),
                        AppLayout.paddingSmall.heightBox,
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(
                              context,
                            ).copyWith(scrollbars: false),
                            child: ListView.builder(
                              itemCount: _projectList.length,
                              itemBuilder: (context, index) {
                                final Project project = _projectList[index];
                                return CusProjectCard(project: project);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
