import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/file.dart';
import 'package:flutter/material.dart';

class AttachmentItem extends StatelessWidget {
  final TaskFile taskFile;
  const AttachmentItem({super.key, required this.taskFile});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.only(right: AppLayout.paddingSmall),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          ),
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withAlpha(20),
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          ),
          child: Image.asset(
            taskFile.url,
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          right: 15,
          child: Container(
            padding: (AppLayout.paddingSmall / 2).allPadding,
            decoration: BoxDecoration(
              color: AppColor.secondColor,
              borderRadius: BorderRadius.circular(AppLayout.borderRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskFile.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: TextTheme.of(context).labelSmall?.fontSize,
                  ),
                ),
                Text(
                  taskFile.uploadTime.fullDate,
                  style: TextTheme.of(context).labelSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
