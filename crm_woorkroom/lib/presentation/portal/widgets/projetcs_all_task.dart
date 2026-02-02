import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/presentation/portal/dialog/share_folder_dialog.dart';
import 'package:crm_woorkroom/presentation/widgets/attachment_item.dart';
import 'package:flutter/material.dart';

class ProjetcsAllTask extends StatelessWidget {
  final Project project;
  const ProjetcsAllTask({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(project.name, style: TextTheme.of(context).displaySmall),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit_note_rounded, size: 20),
            ),
            AppLayout.paddingSmall.widthBox,
            ShareFolderButton(),
          ],
        ),
        AppLayout.paddingSmall.heightBox,
        Expanded(
          child: Container(
            padding: AppLayout.paddingMedium.allPadding,
            decoration: BoxDecoration(
              color: AppColor.secondColor,
              borderRadius: BorderRadius.circular(AppLayout.borderRadius),
            ),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: ListView.builder(
                itemCount: project.tasks.length,
                itemBuilder: (context, index) {
                  final Task task = project.tasks[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.name,
                        style: TextTheme.of(context).displaySmall,
                      ),
                      AppLayout.paddingMedium.heightBox,
                      Text(
                        task.description,
                        style: TextTheme.of(context).labelMedium,
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
    );
  }
}
