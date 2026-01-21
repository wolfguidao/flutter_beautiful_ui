import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashProjects extends StatelessWidget {
  final double width;
  final double height;
  const DashProjects({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.675,
      height: height * 0.475,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Projects", style: TextTheme.of(context).bodyMedium),
          AppLayout.paddingSmall.heightBox,
          ...AppMock.projectList.sublist(0, 3).map((project) {
            return Container(
              decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
              ),
              margin: EdgeInsets.only(bottom: AppLayout.paddingSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: AppLayout.paddingSmall.allPadding,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Color(0xffE4E6E8),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(project.icon, width: 35),
                              AppLayout.paddingSmall.widthBox,
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      project.id,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelSmall,
                                    ),
                                    2.widthBox,
                                    Text(
                                      project.name,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          AppLayout.paddingSmall.heightBox,
                          Row(
                            children: [
                              Icon(Icons.calendar_month_sharp, size: 15),
                              (AppLayout.paddingSmall * 0.5).widthBox,
                              Text(
                                "Created ${project.createTime}",
                                style: TextTheme.of(context).labelSmall,
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_upward,
                                color: project.priority.color,
                                size: 15,
                              ),
                              Text(
                                project.priority.text,
                                style: TextStyle(
                                  fontSize: TextTheme.of(
                                    context,
                                  ).labelMedium?.fontSize,
                                  color: project.priority.color,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: AppLayout.paddingSmall.allPadding,
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color(0xffE4E6E8),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Project Data",
                            style: TextStyle(
                              fontSize: TextTheme.of(
                                context,
                              ).labelMedium?.fontSize,
                            ),
                          ),
                          AppLayout.paddingSmall.heightBox,
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "All Task",
                                      style: TextTheme.of(context).labelSmall,
                                    ),
                                    Text(
                                      project.taskTotal.toString(),
                                      style: TextTheme.of(context).bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Active tasks",
                                      style: TextTheme.of(context).labelSmall,
                                    ),
                                    Text(
                                      project.taskActive.toString(),
                                      style: TextTheme.of(context).bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Assignees",
                                      style: TextTheme.of(context).labelSmall,
                                    ),
                                    SizedBox(
                                      height: 20,
                                      child: Stack(
                                        children: List.generate(
                                          project.assigneeNumber,
                                          (index) {
                                            return Positioned(
                                              left: 15.0 * index,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppColor.secondColor,
                                                    width: 1.25,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    Assets.images.avatar.path,
                                                    width: 20,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
