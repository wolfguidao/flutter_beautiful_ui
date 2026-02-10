import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/message.dart';

class FileMessage extends StatefulWidget {
  final Message message;
  const FileMessage({super.key, required this.message});

  @override
  State<FileMessage> createState() => _FileMessageState();
}

class _FileMessageState extends State<FileMessage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.file_copy_outlined, color: Colors.white),
        AppLayout.paddingSmall.widthBox,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.message.fileName ?? "",
                style: context.textTheme.bodySmall,
              ),
              Text(
                widget.message.fileSize ?? "",
                style: TextStyle(
                  fontSize: context.textTheme.labelMedium?.fontSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
