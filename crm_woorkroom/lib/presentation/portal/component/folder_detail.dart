import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/project_folder.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/presentation/portal/widgets/portal_projects_bar.dart';
import 'package:crm_woorkroom/presentation/widgets/component/attachment_item.dart';
import 'package:flutter/material.dart';

class FolderDetail extends StatefulWidget {
  final ProjectFolder projectFolder;
  final VoidCallback onBack;
  const FolderDetail({
    super.key,
    required this.projectFolder,
    required this.onBack,
  });

  @override
  State<FolderDetail> createState() => _FolderDetailState();
}

class _FolderDetailState extends State<FolderDetail> {
  late Project _activeProject;

  @override
  void initState() {
    _activeProject = widget.projectFolder.projectList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          children: [
            GestureDetector(
              onTap: () => widget.onBack(),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: AppColor.primaryColor,
                    size: 15,
                  ),
                  AppLayout.paddingSmall.widthBox,
                  Text(
                    "Back to Info Portal",
                    style: TextStyle(
                      fontSize: TextTheme.of(context).labelMedium?.fontSize,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.projectFolder.name,
                  style: TextTheme.of(context).displayMedium,
                ),
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
            Expanded(
              child: Row(
                children: [
                  PortalProjectsBar(
                    width: width,
                    onTap: (value) {
                      setState(() {
                        _activeProject = value;
                      });
                    },
                    projectList: widget.projectFolder.projectList,
                  ),
                  AppLayout.paddingMedium.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _activeProject.name,
                          style: TextTheme.of(context).displaySmall,
                        ),
                        AppLayout.paddingSmall.heightBox,
                        Expanded(
                          child: Container(
                            padding: AppLayout.paddingMedium.allPadding,
                            decoration: BoxDecoration(
                              color: AppColor.secondColor,
                              borderRadius: BorderRadius.circular(
                                AppLayout.borderRadius,
                              ),
                            ),
                            child: ScrollConfiguration(
                              behavior: ScrollConfiguration.of(
                                context,
                              ).copyWith(scrollbars: false),
                              child: ListView.builder(
                                itemCount: _activeProject.tasks.length,
                                itemBuilder: (context, index) {
                                  final Task task = _activeProject.tasks[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        task.name,
                                        style: TextTheme.of(
                                          context,
                                        ).displaySmall,
                                      ),
                                      AppLayout.paddingMedium.heightBox,
                                      Text(
                                        task.description,
                                        style: TextTheme.of(
                                          context,
                                        ).labelMedium,
                                      ),
                                      AppLayout.paddingSmall.heightBox,
                                      Wrap(
                                        children: task.attachments.map((file) {
                                          return AttachmentItem(taskFile: file);
                                        }).toList(),
                                      ),
                                      AppLayout.paddingLarge.heightBox,
                                    ],
                                  );
                                },
                              ),
                            ),
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
