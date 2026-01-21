import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DashActivityStream extends StatelessWidget {
  final double width;
  final double height;
  const DashActivityStream({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.30,
      height: height * 0.475,
      padding: AppLayout.paddingSmall.allPadding,
      decoration: BoxDecoration(
        color: AppColor.secondColor,
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Activity Stream", style: TextTheme.of(context).bodyMedium),
          AppLayout.paddingMedium.heightBox,
          Expanded(
            child: Column(
              children: AppMock.activityList.sublist(0, 1).map((activity) {
                return Column(
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(activity.avatar, width: 30),
                        ),
                        AppLayout.paddingSmall.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activity.username,
                              style: TextStyle(
                                fontSize: TextTheme.of(
                                  context,
                                ).labelMedium?.fontSize,
                              ),
                            ),
                            Text(
                              activity.userRole,
                              style: TextTheme.of(context).labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    ...activity.item.map((item) {
                      return Container(
                        padding: AppLayout.paddingSmall.allPadding,
                        margin: (AppLayout.paddingSmall * 0.5).verticalPadding,
                        decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.circular(
                            AppLayout.borderRadius,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              item.iconData,
                              color: item.iconColor,
                              size: 20,
                            ),
                            AppLayout.paddingSmall.widthBox,
                            Expanded(
                              child: Text(
                                item.content,
                                style: TextStyle(
                                  fontSize: TextTheme.of(
                                    context,
                                  ).labelMedium?.fontSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                );
              }).toList(),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: Size(100, 30),
                maximumSize: Size(100, 30),
                backgroundColor: AppColor.secondColor,
                foregroundColor: AppColor.primaryColor,
              ),
              child: Row(
                children: [
                  Text(
                    "View more",
                    style: TextStyle(
                      fontSize: TextTheme.of(context).labelMedium?.fontSize,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, size: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
