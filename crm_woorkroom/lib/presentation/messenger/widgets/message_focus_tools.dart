import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class MessageFocusTools extends StatefulWidget {
  final VoidCallback onRemove;
  final Offset messageOffset;
  final Size messageSize;
  const MessageFocusTools({
    super.key,
    required this.onRemove,
    required this.messageOffset,
    required this.messageSize,
  });

  @override
  State<MessageFocusTools> createState() => _MessageFocusToolsState();
}

class _MessageFocusToolsState extends State<MessageFocusTools> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => widget.onRemove(),
              child: ColoredBox(color: Colors.transparent),
            ),
          ),
          Positioned(
            top: widget.messageOffset.dy.abs() - AppLayout.paddingLarge,
            left:
                widget.messageOffset.dx.abs() + widget.messageSize.width * 0.7,
            child: Container(
              padding: (AppLayout.paddingSmall / 2).allPadding,
              decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColor.backgroundColor,
                      maximumSize: Size(25, 25),
                      minimumSize: Size(25, 25),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.push_pin_outlined, size: 15),
                  ),
                  (AppLayout.paddingSmall / 2).widthBox,
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColor.backgroundColor,
                      maximumSize: Size(25, 25),
                      minimumSize: Size(25, 25),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.bubble_chart_outlined, size: 15),
                  ),
                  (AppLayout.paddingSmall / 2).widthBox,
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColor.backgroundColor,
                      maximumSize: Size(25, 25),
                      minimumSize: Size(25, 25),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.share_outlined, size: 15),
                  ),
                  (AppLayout.paddingSmall / 2).widthBox,
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColor.backgroundColor,
                      maximumSize: Size(25, 25),
                      minimumSize: Size(25, 25),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.edit_note_outlined, size: 15),
                  ),
                  (AppLayout.paddingSmall / 2).widthBox,
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Color(0xffFEE7E9),
                      maximumSize: Size(25, 25),
                      minimumSize: Size(25, 25),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline,
                      size: 15,
                      color: Color(0xffF65160),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
