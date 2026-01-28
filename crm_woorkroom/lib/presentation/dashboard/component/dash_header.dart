import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class DashHeader extends StatelessWidget {
  const DashHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Welcome back,Evan!", style: TextTheme.of(context).labelMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dashboard", style: TextTheme.of(context).displayMedium),
            Container(
              width: 180,
              padding: EdgeInsets.symmetric(
                horizontal: AppLayout.paddingSmall,
                vertical: AppLayout.paddingSmall * 0.5,
              ),
              decoration: BoxDecoration(
                color: Color(0xffE6EDF5),
                borderRadius: BorderRadius.circular(AppLayout.borderRadius / 2),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 15),
                  Spacer(),
                  Text(
                    "Now 16,2020 - Dec 16,2020",
                    style: TextStyle(
                      fontSize: TextTheme.of(context).labelMedium?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
