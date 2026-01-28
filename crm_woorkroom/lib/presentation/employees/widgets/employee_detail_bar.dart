import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:flutter/material.dart';

class EmployeeDetailBar extends StatefulWidget {
  final double width;
  final Employee employee;
  final List<Project> projectList;
  const EmployeeDetailBar({
    super.key,
    required this.width,
    required this.employee,
    required this.projectList,
  });

  @override
  State<EmployeeDetailBar> createState() => _EmployeeDetailBarState();
}

class _EmployeeDetailBarState extends State<EmployeeDetailBar> {
  late double _averageProgress;

  @override
  void initState() {
    _initData();
    super.initState();
  }

  void _initData() {
    if (widget.projectList.isEmpty) {
      _averageProgress = 1.0;
    } else {
      double totalProgress = 0.0;
      for (Project project in widget.projectList) {
        totalProgress += project.averageProgress;
      }
      _averageProgress = totalProgress / widget.projectList.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.2,
      decoration: BoxDecoration(
        color: AppColor.secondColor,
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: AppLayout.paddingSmall.allPadding,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColor.borderColor)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 55,
                  height: 55,
                  child: Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          widget.employee.avatar,
                          width: 50,
                          height: 50,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: CircularProgressIndicator(
                          value: _averageProgress,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(widget.employee.name),
                Text(
                  widget.employee.position,
                  style: TextTheme.of(context).labelMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: AppLayout.paddingSmall.allPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Main info"),
                  AppLayout.paddingMedium.heightBox,
                  CusLabelTextfile(
                    label: "Position",
                    hintText: widget.employee.position,
                  ),
                  AppLayout.paddingSmall.heightBox,
                  CusLabelTextfile(
                    label: "Company",
                    hintText: widget.employee.company,
                  ),
                  AppLayout.paddingSmall.heightBox,
                  CusLabelTextfile(
                    label: "Location",
                    hintText: widget.employee.location,
                  ),
                  AppLayout.paddingSmall.heightBox,
                  CusLabelTextfile(
                    label: "Birthday Date",
                    hintText: widget.employee.bitrhday.fullDate,
                  ),
                  AppLayout.paddingSmall.heightBox,
                  Text("Contact Info"),
                  AppLayout.paddingMedium.heightBox,
                  CusLabelTextfile(
                    label: "Email",
                    hintText: widget.employee.email,
                  ),
                  AppLayout.paddingSmall.heightBox,
                  CusLabelTextfile(
                    label: "Mobile Number",
                    hintText: widget.employee.mobile,
                  ),
                  AppLayout.paddingSmall.heightBox,
                  CusLabelTextfile(
                    label: "Skype",
                    hintText: widget.employee.skype,
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
