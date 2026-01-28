import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_project_card.dart';
import 'package:flutter/material.dart';

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
            return CusProjectCard(project: project);
          }),
        ],
      ),
    );
  }
}
