import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/projects/component/projects_bar.dart';
import 'package:crm_woorkroom/presentation/projects/component/projects_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final List<String> _viewTypes = [
    Assets.images.list,
    Assets.images.board,
    Assets.images.timeline,
  ];

  int _activeType = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Projects", style: TextTheme.of(context).displayMedium),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 15),
                      Text(
                        "Add Project",
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
            Expanded(
              child: Row(
                children: [
                  ProjectsBar(width: width),
                  AppLayout.paddingMedium.widthBox,
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Task",
                              style: TextTheme.of(context).displayMedium,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(_viewTypes.length, (
                                index,
                              ) {
                                return Padding(
                                  padding:
                                      AppLayout.paddingSmall.horizontalPadding,
                                  child: IconButton(
                                    style: IconButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: _activeType == index
                                              ? AppColor.primaryColor
                                              : AppColor.secondColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          AppLayout.borderRadius,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _activeType = index;
                                      });
                                    },
                                    icon: SvgPicture.asset(
                                      _viewTypes[index],
                                      colorFilter: ColorFilter.mode(
                                        _activeType == index
                                            ? AppColor.primaryColor
                                            : Colors.black,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.filter_list_outlined, size: 20),
                            ),
                          ],
                        ),
                        AppLayout.paddingSmall.heightBox,
                        Expanded(
                          child: ProjectsListView(
                            project: AppMock.projectList[0],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
