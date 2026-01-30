import 'dart:math';

import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project_folder.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_animated_delay_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoPortal extends StatelessWidget {
  final ValueChanged<ProjectFolder> onTap;
  const InfoPortal({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final List<String> folderType = [
      Assets.images.folder01,
      Assets.images.folder02,
      Assets.images.folder03,
      Assets.images.folder04,
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final double wdith = constraints.maxWidth;
        final double height = constraints.maxHeight;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Info Portal", style: TextTheme.of(context).displayMedium),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 15),
                      Text(
                        "Add Folder",
                        style: TextStyle(
                          fontSize: TextTheme.of(context).labelMedium?.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppLayout.paddingSmall.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: wdith * 0.75,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    color: AppColor.secondColor,
                    borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: AppLayout.paddingLarge.allPadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your project data warehouse",
                                style: TextTheme.of(context).displaySmall,
                              ),
                              AppLayout.paddingMedium.heightBox,
                              Text(
                                "Add project data, create thematic pages, edit data, share information with team members",
                                style: TextTheme.of(context).labelMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        Assets.images.portalIllus,
                        width: wdith * 0.25,
                        fit: BoxFit.fitWidth,
                      ),
                      AppLayout.paddingLarge.widthBox,
                    ],
                  ),
                ),
                Container(
                  width: wdith * 0.225,
                  height: height * 0.2,
                  padding: AppLayout.paddingSmall.allPadding,
                  decoration: BoxDecoration(
                    color: AppColor.secondColor,
                    borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current Projects",
                        style: TextTheme.of(context).labelMedium,
                      ),
                      Spacer(),
                      Text(
                        AppMock.projectList.length.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                      (AppLayout.paddingSmall / 2).heightBox,
                      Text(
                        "Growth +${AppMock.projectList.length}",
                        style: TextStyle(
                          fontSize: TextTheme.of(context).labelSmall?.fontSize,
                          color: Color(0xff0AC947),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Ongoing projects last month - 7",
                        style: TextTheme.of(context).labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppLayout.paddingMedium.heightBox,
            Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              children: List.generate(AppMock.projectFolderList.length, (
                index,
              ) {
                final ProjectFolder projectFolder =
                    AppMock.projectFolderList[index];
                return CusAnimatedDelayItem(
                  index: index,
                  child: GestureDetector(
                    onTap: ()=>onTap(projectFolder),
                    child: Container(
                      width: wdith * 0.225,
                      height: height * 0.15,
                      padding: AppLayout.paddingSmall.allPadding,
                      margin: AppLayout.paddingSmall.allPadding,
                      decoration: BoxDecoration(
                        color: AppColor.secondColor,
                        borderRadius: BorderRadius.circular(
                          AppLayout.borderRadius,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SvgPicture.asset(
                              folderType[Random().nextInt(3)],
                            ),
                          ),
                          Text(projectFolder.name),
                          Text(
                            "${projectFolder.projectList.length} Projects",
                            style: TextTheme.of(context).labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
