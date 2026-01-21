import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class DashNearestEvents extends StatelessWidget {
  final double width;
  final double height;
  const DashNearestEvents({super.key, required this.width, required this.height});

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Nearest Events", style: TextTheme.of(context).bodyMedium),
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
          ...AppMock.eventList.map((event) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppLayout.paddingSmall,
                vertical: AppLayout.paddingSmall * 0.2,
              ),
              margin: EdgeInsets.only(bottom: AppLayout.paddingMedium),
              height: height * 0.1,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: event.lever.color, width: 2),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          event.title,
                          style: TextTheme.of(context).bodyMedium,
                        ),
                      ),
                      AppLayout.paddingMedium.widthBox,
                      Icon(
                        Icons.arrow_upward,
                        size: 15,
                        color: event.lever.color,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(event.time, style: TextTheme.of(context).labelSmall),
                      AppLayout.paddingMedium.widthBox,
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.circular(
                            AppLayout.borderRadius / 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time_filled_rounded,
                              size: 15,
                              color: AppColor.hintColor,
                            ),
                            (AppLayout.paddingSmall * 0.5).widthBox,
                            Text(
                              event.timeConsume,
                              style: TextTheme.of(context).labelSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
