import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/message.dart';
import 'package:crm_woorkroom/presentation/messenger/widgets/message_focus_tools.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_circle_avatar.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatefulWidget {
  final Message message;
  final bool isFocus;
  final ValueChanged<Message> onFocus;
  final VoidCallback onCancelFocus;
  const MessageItem({
    super.key,
    required this.message,
    required this.isFocus,
    required this.onFocus,
    required this.onCancelFocus,
  });

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  final GlobalKey _key = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _remove() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    widget.onCancelFocus();
  }

  void _showFocusTools() {
    final RenderBox? renderBox =
        _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    Offset offset = renderBox.globalToLocal(Offset.zero);
    Size size = renderBox.size;
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return MessageFocusTools(
          onRemove: _remove,
          messageOffset: offset,
          messageSize: size,
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      onLongPress: () {
        widget.onFocus(widget.message);
        _showFocusTools();
      },
      child: Container(
        padding: AppLayout.paddingSmall.allPadding,
        decoration: BoxDecoration(
          color: widget.isFocus ? AppColor.backgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(AppLayout.borderRadius),
        ),
        margin: AppLayout.paddingSmall.horizontalPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CusCircleAvatar(avatar: widget.message.sender.avatar, size: 30),
            AppLayout.paddingSmall.widthBox,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.message.sender.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      AppLayout.paddingSmall.widthBox,
                      Text(
                        widget.message.sendTime.messageTime,
                        style: TextTheme.of(context).labelSmall,
                      ),
                    ],
                  ),
                  (AppLayout.paddingSmall / 2).heightBox,
                  MessageContent(message: widget.message),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageContent extends StatelessWidget {
  final Message message;
  const MessageContent({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.type == MessageType.text) {
      return Text(
        message.content ?? "",
        style: TextStyle(
          fontSize: TextTheme.of(context).labelMedium?.fontSize,
          fontWeight: FontWeight.normal,
        ),
      );
    } else if (message.type == MessageType.image) {
      return Row(
        children: [
          Container(
            padding: (AppLayout.paddingSmall / 2).allPadding,
            decoration: BoxDecoration(
              color: Color(0xffF1EFFB),
              borderRadius: BorderRadius.circular(AppLayout.borderRadius),
            ),
            child: Center(
              child: Icon(
                Icons.image_outlined,
                color: Color(0xff6D5DD3),
                size: 20,
              ),
            ),
          ),
          AppLayout.paddingSmall.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.fileName ?? "",
                style: TextStyle(
                  fontSize: TextTheme.of(context).labelMedium?.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message.fileSize ?? "",
                style: TextTheme.of(context).labelSmall,
              ),
            ],
          ),
        ],
      );
    }
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      padding: (AppLayout.paddingSmall).allPadding,
      decoration: BoxDecoration(
        color: Color(0xffE8F9FC),
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.link, color: Color(0xff15C0E6), size: 20),
          (AppLayout.paddingSmall / 2).widthBox,
          Text(
            message.fileName ?? "",
            style: TextStyle(
              color: Color(0xff15C0E6),
              fontSize: TextTheme.of(context).labelMedium?.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
