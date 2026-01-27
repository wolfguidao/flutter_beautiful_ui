import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/user.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_scroller_bar.dart';
import 'package:flutter/material.dart';

class VacationsCalendar extends StatefulWidget {
  const VacationsCalendar({super.key});

  @override
  State<VacationsCalendar> createState() => _VacationsCalendarState();
}

class _VacationsCalendarState extends State<VacationsCalendar> {
  late DateTime _dateTime;
  late ScrollController _controller;
  final double _squareSize = 30;
  final double _borderHeight = 1;

  @override
  void initState() {
    _dateTime = DateTime.now();
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Container(
          decoration: BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          ),
          child: Row(
            children: [
              Container(
                width: width * 0.2,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: AppColor.borderColor),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60 + AppLayout.paddingSmall / 2,
                      padding: AppLayout.paddingSmall.allPadding,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColor.borderColor),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Employees",
                            style: TextTheme.of(context).displaySmall,
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColor.backgroundColor,
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.search, size: 18),
                          ),
                        ],
                      ),
                    ),
                    ...AppMock.userList.map((user) {
                      return Container(
                        height: 35,
                        padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.paddingSmall,
                          vertical: AppLayout.paddingSmall / 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: AppColor.borderColor),
                          ),
                        ),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(user.avatar, width: 25),
                            ),
                            AppLayout.paddingSmall.widthBox,
                            Text(user.name, maxLines: 1),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Spacer(),
                          Text(_dateTime.enMonth),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back,
                              size: 15,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 15,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CustomScrollView(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        slivers: [
                          SliverList.builder(
                            itemCount: DateTime(
                              _dateTime.year,
                              _dateTime.month + 1,
                              0,
                            ).day,
                            itemBuilder: (context, index) {
                              final DateTime date = DateTime(
                                _dateTime.year,
                                _dateTime.month,
                                index + 1,
                              );
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: (AppLayout.paddingSmall / 2)
                                        .horizontalPadding,
                                    child: Container(
                                      width: _squareSize,
                                      height: _squareSize - _borderHeight,
                                      margin: EdgeInsets.only(
                                        bottom: AppLayout.paddingSmall / 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.backgroundColor,
                                        borderRadius: BorderRadius.circular(
                                          AppLayout.borderRadius / 2,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(date.day.toString()),
                                          Text(
                                            date.enWeekDay,
                                            style: TextTheme.of(
                                              context,
                                            ).labelSmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: _squareSize + AppLayout.paddingSmall,
                                    height: _borderHeight,
                                    color: AppColor.borderColor,
                                  ),
                                  ...AppMock.userList.map((user) {
                                    int index = user.vacations.indexWhere(
                                      (e) => e.date == date,
                                    );
                                    UserVacation? userVacation;
                                    if (index != -1) {
                                      userVacation = user.vacations[index];
                                    }
                                    return Container(
                                      width: _squareSize,
                                      height: _squareSize,
                                      margin: EdgeInsets.symmetric(
                                        vertical: 2.5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: userVacation == null
                                            ? Color(0xffF4F9FD)
                                            : userVacation.isApproved
                                            ? userVacation.type.approvedColor
                                            : userVacation.type.pendingColor,
                                        borderRadius: BorderRadius.circular(
                                          AppLayout.borderRadius / 2,
                                        ),
                                        border: Border.all(
                                          color: userVacation == null
                                              ? Color(0xffF4F9FD)
                                              : userVacation.type.approvedColor,
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.paddingSmall,
                        vertical: AppLayout.paddingSmall / 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CusScrollerBar(
                            scrollController: _controller,
                            backgorundColor: Color(0xffF6F8FD),
                            barColor: Color(0xffD3DBEB),
                          ),
                          (AppLayout.paddingSmall / 2).heightBox,
                          Row(
                            children: VacationType.values.map((vacation) {
                              return Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      vacation.text,
                                      style: TextTheme.of(context).labelMedium,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: vacation.approvedColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        AppLayout.paddingSmall.widthBox,
                                        Text("Approved"),
                                        AppLayout.paddingMedium.widthBox,
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: vacation.pendingColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        AppLayout.paddingSmall.widthBox,
                                        Text("Pending"),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
