import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/projects/dialog/add_projects_dialog.dart';
import 'package:flutter/material.dart';

class ProjectsHeader extends StatelessWidget {
  final bool showProjectDetail;
  final String projectName;
  final VoidCallback onBack;
  const ProjectsHeader({
    super.key,
    required this.showProjectDetail,
    required this.projectName,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    if (showProjectDetail) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => onBack(),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: AppColor.primaryColor,
                      size: 15,
                    ),
                    Text(
                      "Back to Project",
                      style: TextStyle(
                        fontSize: TextTheme.of(context).labelMedium?.fontSize,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Text(projectName, style: TextTheme.of(context).displayMedium),
            ],
          ),
          AddProjectsButton(),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Projects", style: TextTheme.of(context).displayMedium),
        AddProjectsButton(),
      ],
    );
  }
}
