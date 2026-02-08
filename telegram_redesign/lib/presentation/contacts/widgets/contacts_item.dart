import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/user.dart';
import 'package:telegram_redesign/widgets/cus_circle_avatar.dart';

class ContactsItem extends StatefulWidget {
  final User user;
  const ContactsItem({super.key, required this.user});

  @override
  State<ContactsItem> createState() => _ContactsItemState();
}

class _ContactsItemState extends State<ContactsItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppLayout.paddingSmall.horizontalPadding,
      child: Row(
        children: [
          CusCircleAvatar(avatar: widget.user.avatar, showStatus: false),
          AppLayout.paddingSmall.widthBox,
          Expanded(
            child: Container(
              padding: AppLayout.paddingSmall.verticalPadding,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.borderColor),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.user.nickname),
                  Text(
                    widget.user.userStatus,
                    style: context.textTheme.labelMedium,
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
