import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:flutter/material.dart';

class PortalProjectsBar extends StatefulWidget {
  final double width;
  final ValueChanged<Project> onTap;
  final List<Project> projectList;
  const PortalProjectsBar({
    super.key,
    required this.width,
    required this.onTap,
    required this.projectList,
  });

  @override
  State<PortalProjectsBar> createState() => _PortalProjectsBarState();
}

class _PortalProjectsBarState extends State<PortalProjectsBar> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.2,
      decoration: BoxDecoration(
        color: AppColor.secondColor,
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Column(
        children: [
          Container(
            padding: AppLayout.paddingSmall.allPadding,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColor.borderColor)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Projects"),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: AppColor.secondColor,
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.add, size: 15),
                ),
              ],
            ),
          ),
          (AppLayout.paddingSmall/2).heightBox,
          ...List.generate(widget.projectList.length, (index) {
            final Project project = widget.projectList[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _activeIndex = index;
                });
                widget.onTap(project);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 50),
                padding: (AppLayout.paddingSmall / 2).horizontalPadding,
                decoration: BoxDecoration(
                  border: Border(
                    right: _activeIndex == index
                        ? BorderSide(color: AppColor.primaryColor, width: 2)
                        : BorderSide.none,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  padding: AppLayout.paddingSmall.allPadding,
                  decoration: BoxDecoration(
                    color: _activeIndex == index
                        ? AppColor.backgroundColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(project.name),
                      (AppLayout.paddingSmall/2).heightBox,
                      Text(
                        project.deadline,
                        style: TextTheme.of(context).labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
