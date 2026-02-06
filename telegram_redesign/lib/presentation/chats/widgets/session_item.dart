import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/session.dart';
import 'package:telegram_redesign/widgets/cus_circle_avatar.dart';

class SessionItem extends StatefulWidget {
  final Session session;
  const SessionItem({super.key, required this.session});

  @override
  State<SessionItem> createState() => _SessionItemState();
}

class _SessionItemState extends State<SessionItem> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: widget.session.isPinned?AppColors.backgroundColor:Colors.transparent,
      child: Row(
        children: [
          CusCircleAvatar(
              sessionStatus: widget.session.status,
              avatar: widget.session.avatar, showProgress: true),
          Expanded(
            child: Container(
              margin: AppLayout.paddingSmall.allPadding,
              padding: (AppLayout.paddingSmall / 2).verticalPadding,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.borderColor)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          widget.session.name,
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.session.latestMessage == null
                              ? ""
                              : widget
                                    .session
                                    .latestMessage!
                                    .timestamp
                                    .enTimeByNow,
                          style: context.textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                  (AppLayout.paddingSmall / 2).heightBox,
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          widget.session.latestMessage == null
                              ? "No Message"
                              : widget.session.latestMessage?.text ??
                                    "No Message",
                          style: context.textTheme.labelMedium,
                        ),
                      ),
                      AppLayout.paddingSmall.widthBox,
                      if (widget.session.unreadCount != 0 && !widget.session.isPinned)
                        Container(
                          width: 22.5,
                          height: 22.5,
                          padding: (AppLayout.paddingSmall * 0.1).allPadding,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text("${widget.session.unreadCount}"),
                          ),
                        ),
                      if(widget.session.isPinned)
                        Icon(Icons.push_pin_outlined,color: AppColors.hintTextColor,size:context.iconSize,)
                    ],
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
