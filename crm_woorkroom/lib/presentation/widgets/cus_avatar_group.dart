import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:flutter/material.dart';

class CusAvatarGroup extends StatelessWidget {
  final List<Employee> employeeList;
  final double height;
  final int displayNumber;
  const CusAvatarGroup({
    super.key,
    required this.employeeList,
    required this.height,
    required this.displayNumber,
  });

  @override
  Widget build(BuildContext context) {
    int showCount = employeeList.length > displayNumber
        ? displayNumber
        : employeeList.length;
    int remainCount = employeeList.length - showCount;
    if (showCount == 0) {
      return Text("$showCount");
    }

    return SizedBox(
      height: height,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          ...List.generate(showCount, (index) {
            return Positioned(
              left: index * 12,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.secondColor),
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.hardEdge,
                child: ClipOval(
                  child: Image.asset(
                    employeeList[index].avatar,
                    fit: BoxFit.fill,
                    width: height,
                    height: height,
                  ),
                ),
              ),
            );
          }),
          if (remainCount > 0)
            Positioned(
              left: showCount * 12,
              child: Container(
                width: height,
                height: height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primaryColor,
                ),
                child: Center(
                  child: Text(
                    "+$remainCount",
                    style: TextStyle(
                      color: AppColor.secondColor,
                      fontSize: TextTheme.of(context).labelSmall?.fontSize,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
