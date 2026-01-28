import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_label_widget.dart';
import 'package:flutter/material.dart';

class EmployeesListview extends StatefulWidget {
  final ValueChanged<Employee> onTap;
  const EmployeesListview({super.key, required this.onTap});

  @override
  State<EmployeesListview> createState() => _EmployeesListviewState();
}

class _EmployeesListviewState extends State<EmployeesListview> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: AppMock.userList.length,
            itemBuilder: (context, index) {
              final Employee employee = AppMock.userList[index];
              return GestureDetector(
                onTap: () => widget.onTap(employee),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.paddingMedium,
                    vertical: AppLayout.paddingSmall,
                  ),
                  margin: EdgeInsets.only(bottom: AppLayout.paddingMedium),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                    color: AppColor.secondColor,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(employee.avatar, width: 30),
                            ),
                            AppLayout.paddingSmall.widthBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(employee.name),
                                Text(
                                  employee.email,
                                  style: TextTheme.of(context).labelSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CusLabelWidget(
                          label: "Gender",
                          child: Text(employee.gender),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CusLabelWidget(
                          label: "Birthday",
                          child: Text(employee.bitrhday.fullDate),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CusLabelWidget(
                          label: "Full Age",
                          child: Text(employee.age.toString()),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CusLabelWidget(
                              label: "Position",
                              child: Text(employee.position),
                            ),
                            Container(
                              margin: AppLayout.paddingSmall.horizontalPadding,
                              padding: EdgeInsets.symmetric(
                                horizontal: AppLayout.paddingSmall,
                                vertical: AppLayout.paddingSmall * 0.3,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppLayout.borderRadius / 2,
                                ),
                                border: Border.all(color: AppColor.borderColor),
                              ),
                              child: Center(
                                child: Text(
                                  employee.lever,
                                  style: TextTheme.of(context).labelSmall,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColor.backgroundColor,
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.more_vert, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
