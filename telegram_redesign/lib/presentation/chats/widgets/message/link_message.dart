import 'package:flutter/material.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/entity/message.dart';

class LinkMessage extends StatefulWidget {
  final Message message;
  const LinkMessage({super.key, required this.message});

  @override
  State<LinkMessage> createState() => _LinkMessageState();
}

class _LinkMessageState extends State<LinkMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.message.content, style: context.textTheme.bodySmall),
        LinkPreview(
          titleTextStyle: TextStyle(
            fontSize: context.textTheme.bodySmall?.fontSize,
            fontWeight: FontWeight.bold,
          ),
          descriptionTextStyle: context.textTheme.bodySmall,
          onLinkPreviewDataFetched: (value) {},
          text: widget.message.linkUrl ?? "",
        ),
      ],
    );
  }
}
