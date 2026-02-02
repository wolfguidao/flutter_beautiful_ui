import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_animated_delay_item.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_widget.dart';
import 'package:flutter/material.dart';

class ProfileVacations extends StatefulWidget {
  final Employee employee;
  const ProfileVacations({super.key, required this.employee});

  @override
  State<ProfileVacations> createState() => _ProfileVacationsState();
}

class _ProfileVacationsState extends State<ProfileVacations> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.employee.userVacation.map((userVacation) {
                    return Container(
                      width: width * 0.3,
                      padding: AppLayout.paddingMedium.allPadding,
                      decoration: BoxDecoration(
                        color: AppColor.secondColor,
                        borderRadius: BorderRadius.circular(
                          AppLayout.borderRadius,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: Stack(
                              alignment: AlignmentGeometry.center,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: CircularProgressIndicator(
                                    value:
                                        userVacation.used / userVacation.total,
                                    color: userVacation.type.approvedColor,
                                  ),
                                ),
                                Text(
                                  "${userVacation.used}",
                                  style: TextStyle(
                                    fontSize: TextTheme.of(
                                      context,
                                    ).displayMedium?.fontSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppLayout.paddingMedium.heightBox,
                          Text(userVacation.type.text),
                          (AppLayout.paddingSmall / 2).heightBox,
                          Text(
                            "${userVacation.used}/${userVacation.total} days availible",
                            style: TextTheme.of(context).labelSmall,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SliverAppBar(
                backgroundColor: Colors.transparent,
                centerTitle: false,
                title: Text(
                  "My Requests",
                  style: TextTheme.of(context).displaySmall,
                ),
              ),
              SliverList.builder(
                itemCount: widget.employee.vacationsRequest.length,
                itemBuilder: (context, index) {
                  final VacationRequest vacationRequest =
                      widget.employee.vacationsRequest[index];
                  return CusAnimatedDelayItem(
                    index: index,
                    child: Container(
                      padding: AppLayout.paddingSmall.allPadding,
                      margin: EdgeInsets.only(bottom: AppLayout.paddingSmall),
                      decoration: BoxDecoration(
                        color: AppColor.secondColor,
                        borderRadius: BorderRadius.circular(
                          AppLayout.borderRadius,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CusLabelWidget(
                              label: "Request Type",
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    margin: EdgeInsets.only(
                                      right: AppLayout.paddingSmall,
                                    ),
                                    decoration: BoxDecoration(
                                      color: vacationRequest.type.approvedColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(vacationRequest.type.text),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: CusLabelWidget(
                              label: "Duration",
                              child: Text("${vacationRequest.duration} Days"),
                            ),
                          ),
                          Expanded(
                            child: CusLabelWidget(
                              label: "Start Day",
                              child: Text(vacationRequest.startDay.fullDate),
                            ),
                          ),
                          Expanded(
                            child: CusLabelWidget(
                              label: "End Day",
                              child: Text(vacationRequest.endDay.fullDate),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: CusLabelWidget(
                              label: "",
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppLayout.paddingSmall,
                                  vertical: AppLayout.paddingSmall * 0.5,
                                ),
                                decoration: BoxDecoration(
                                  color: vacationRequest.isApproved
                                      ? Color(0xff00D097)
                                      : Color(0xffFDC748),
                                  borderRadius: BorderRadius.circular(
                                    AppLayout.borderRadius / 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    vacationRequest.isApproved
                                        ? "Pending"
                                        : "Approved",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: TextTheme.of(
                                        context,
                                      ).labelMedium?.fontSize,
                                    ),
                                  ),
                                ),
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
      },
    );
  }
}
