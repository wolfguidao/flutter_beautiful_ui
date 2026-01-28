import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/user.dart';
import 'package:flutter/material.dart';

class VacationsListview extends StatefulWidget {
  const VacationsListview({super.key});

  @override
  State<VacationsListview> createState() => _VacationsListviewState();
}

class _VacationsListviewState extends State<VacationsListview> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: AppMock.userList.length,
            itemBuilder: (context, index) {
              final Employee user = AppMock.userList[index];
              final int vacations = user.vacations
                  .where((e) => e.type == VacationType.vacation)
                  .toList()
                  .length;
              final int sickLeave = user.vacations
                  .where((e) => e.type == VacationType.sickLeave)
                  .toList()
                  .length;
              final int workRemotely = user.vacations
                  .where((e) => e.type == VacationType.workRemotely)
                  .toList()
                  .length;
              return Container(
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
                          ClipOval(child: Image.asset(user.avatar, width: 30)),
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
              );
            },
          ),
        ],
      ),
    );
  }
}
