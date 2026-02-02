import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_animated_delay_item.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_circle_avatar.dart';
import 'package:flutter/material.dart';

class VacationsListview extends StatelessWidget {
  const VacationsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: AppMock.employeeList.length,
            itemBuilder: (context, index) {
              final Employee user = AppMock.employeeList[index];
              final int vacations = user.vacationsRequest
                  .where((e) => e.type == VacationType.vacation)
                  .toList()
                  .length;
              final int sickLeave = user.vacationsRequest
                  .where((e) => e.type == VacationType.sickLeave)
                  .toList()
                  .length;
              final int workRemotely = user.vacationsRequest
                  .where((e) => e.type == VacationType.workRemotely)
                  .toList()
                  .length;
              return CusAnimatedDelayItem(
                index: index,
                roundDelay: 12,
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
                            CusCircleAvatar(avatar: user.avatar, size: 30),
                            AppLayout.paddingSmall.widthBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.name),
                                Text(
                                  user.email,
                                  style: TextTheme.of(context).labelSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vacations",
                              style: TextTheme.of(context).labelMedium,
                            ),
                            Text(vacations.toString()),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sick Leave",
                              style: TextTheme.of(context).labelMedium,
                            ),
                            Text(sickLeave.toString()),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Work Remotely",
                              style: TextTheme.of(context).labelMedium,
                            ),
                            Text(workRemotely.toString()),
                          ],
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
