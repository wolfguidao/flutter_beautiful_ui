import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/session.dart';
import 'package:telegram_redesign/widgets/cus_circle_avatar.dart';

class MessageBar extends StatefulWidget implements PreferredSizeWidget {
  final Session session;
  const MessageBar({super.key, required this.session});

  @override
  State<MessageBar> createState() => _MessageBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MessageBarState extends State<MessageBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(Icons.arrow_back),
      ),
      title: Row(
        children: [
          CusCircleAvatar(avatar: widget.session.avatar, showStatus: false),
          AppLayout.paddingSmall.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.session.name, style: context.textTheme.bodyMedium),
                if (widget.session.type == SessionType.private)
                  Text(
                    widget.session.status.name,
                    style: TextStyle(
                      fontSize: context.textTheme.labelMedium?.fontSize,
                      color: AppColors.primaryColor,
                    ),
                  ),
                if (widget.session.type != SessionType.private)
                  Text(
                    "${widget.session.members.length} Members",
                    style: context.textTheme.labelMedium,
                  ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        if (widget.session.type == SessionType.private)
          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ],
    );
  }
}
