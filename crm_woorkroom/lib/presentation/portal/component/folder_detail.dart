import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/project_folder.dart';
import 'package:crm_woorkroom/presentation/portal/widgets/portal_projects_bar.dart';
import 'package:crm_woorkroom/presentation/portal/widgets/projetcs_all_task.dart';
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

class _FolderDetailState extends State<FolderDetail>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;
  late Project _activeProject;

  @override
  void initState() {
    _activeProject = widget.projectFolder.projectList.first;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(-20.0 * (1 - _animation.value), 0),
                        child: Opacity(opacity: _animation.value, child: child),
                      );
                    },
                    child: PortalProjectsBar(
                      width: width,
                      onTap: (value) {
                        setState(() {
                          _activeProject = value;
                        });
                      },
                      projectList: widget.projectFolder.projectList,
                    ),
                  ),
                  AppLayout.paddingMedium.widthBox,
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(20.0 * (1 - _animation.value), 0),
                          child: Opacity(
                            opacity: _animation.value,
                            child: child,
                          ),
                        );
                      },
                      child: ProjetcsAllTask(project: _activeProject),
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
