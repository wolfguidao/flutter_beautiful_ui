import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/session.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_circle_avatar.dart';
import 'package:flutter/material.dart';

class ConversationItem extends StatefulWidget {
  final Conversation conversation;
  final bool isAcative;
  final ValueChanged<int> onTap;
  const ConversationItem({
    super.key,
    required this.conversation,
    required this.isAcative,
    required this.onTap,
  });

  @override
  State<ConversationItem> createState() => _ConversationItemState();
}

class _ConversationItemState extends State<ConversationItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onTap(widget.conversation.id);
      },
      child: Container(
        padding: (AppLayout.paddingSmall / 2).horizontalPadding,
        decoration: BoxDecoration(
          border: Border(
            right: widget.isAcative
                ? BorderSide(color: AppColor.primaryColor, width: 2)
                : BorderSide.none,
          ),
        ),
        child: Container(
          padding: AppLayout.paddingSmall.allPadding,
          decoration: BoxDecoration(
            color: widget.isAcative
                ? AppColor.backgroundColor
                : AppColor.secondColor,
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          ),
          child: Row(
            children: [
              ClipOval(
                child: CusCircleAvatar(
                  avatar: widget.conversation.avatar,
                  size: 30,
                ),
              ),
              AppLayout.paddingSmall.widthBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.conversation.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: TextTheme.of(
                                context,
                              ).labelMedium?.fontSize,
                            ),
                          ),
                        ),
                        AppLayout.paddingSmall.widthBox,
                        Text(
                          widget.conversation.latestMessage.sendTime.messageTime,
                          style: TextTheme.of(context).labelSmall,
                        ),
                      ],
                    ),
                    (AppLayout.paddingSmall / 2).heightBox,
                    Text(
                      widget.conversation.latestMessage.content ??
                          widget.conversation.latestMessage.fileName ??
                          "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextTheme.of(context).labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
