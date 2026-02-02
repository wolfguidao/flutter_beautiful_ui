import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DashWorkloadCard extends StatelessWidget {
  final double width;
  final double height;
  const DashWorkloadCard({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.675,
      height: height * 0.475,
      padding: AppLayout.paddingSmall.allPadding,
      decoration: BoxDecoration(
        color: AppColor.secondColor,
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Workload", style: TextTheme.of(context).bodyMedium),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  minimumSize: Size(80, 30),
                  maximumSize: Size(80, 30),
                  backgroundColor: AppColor.secondColor,
                  foregroundColor: AppColor.primaryColor,
                ),
                child: Row(
                  children: [
                    Text(
                      "View all",
                      style: TextStyle(
                        fontSize: TextTheme.of(context).labelMedium?.fontSize,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right, size: 15),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: AppLayout.paddingSmall,
                crossAxisSpacing: AppLayout.paddingSmall,
              ),
              itemCount: AppMock.employeeList.take(8).length,
              itemBuilder: (context, index) {
                final Employee employee = AppMock.employeeList[index];
                return Container(
                  padding: AppLayout.paddingSmall.allPadding,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                    color: AppColor.backgroundColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              Assets.images.avatar.path,
                              width: 30,
                            ),
                          ),
                          CircularProgressIndicator(
                            value: 0.7,
                            color: Colors.blue,
                            strokeWidth: 2,
                            backgroundColor: Color(0xffDCE2E7),
                            strokeCap: StrokeCap.round,
                          ),
                        ],
                      ),
                      (AppLayout.paddingSmall / 2).heightBox,
                      Text(
                        employee.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextTheme.of(context).bodySmall,
                      ),
                      Text(
                        employee.position,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextTheme.of(context).labelSmall,
                      ),
                      (AppLayout.paddingSmall / 2).heightBox,
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.hintColor),
                          borderRadius: BorderRadius.circular(
                            AppLayout.borderRadius / 2,
                          ),
                        ),
                        child: Text(
                          employee.lever,
                          style: TextTheme.of(context).labelSmall,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
