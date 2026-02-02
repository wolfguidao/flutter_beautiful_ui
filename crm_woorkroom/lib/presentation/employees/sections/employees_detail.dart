import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/widgets/profile/profile_detail.dart';
import 'package:crm_woorkroom/presentation/widgets/profile/profile_detail_bar.dart';
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
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          children: [
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
                  ProfileDetailBar(width: width, employee: widget.employee),
                  AppLayout.paddingSmall.widthBox,
                  Expanded(child: ProfileDetail(employee: widget.employee)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
