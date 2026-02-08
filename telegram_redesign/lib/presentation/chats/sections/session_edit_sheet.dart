import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/widgets/cus_menu_router_action.dart';

class SessionEditSheet extends StatefulWidget {
  const SessionEditSheet({super.key});

  @override
  State<SessionEditSheet> createState() => _SessionEditSheetState();
}

class _SessionEditSheetState extends State<SessionEditSheet> {
  List<CusMenuRouterAction> _actionList = [];

  @override
  void initState() {
    super.initState();
    _actionList = [
      CusMenuRouterAction(
        icon: Icons.edit_document,
        title: "Create Post",
        route: "",
      ),
      CusMenuRouterAction(icon: Icons.post_add, title: "Post Story", route: ""),
      CusMenuRouterAction(
        icon: Icons.stream,
        title: "Schedule Live Stream",
        route: "",
      ),
      CusMenuRouterAction(
        icon: Icons.wifi_channel,
        title: "Create Channel",
        route: "",
      ),
      CusMenuRouterAction(
        icon: Icons.edit_document,
        title: "Create Group Chat",
        route: "",
      ),
      CusMenuRouterAction(
        icon: Icons.chat_rounded,
        title: "Start Chat",
        route: "",
      ),
      CusMenuRouterAction(icon: Icons.lock, title: "Schedule Call", route: ""),
      CusMenuRouterAction(
        icon: Icons.tips_and_updates,
        title: "Reminder",
        route: "",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppLayout.paddingLarge.allPadding,
      decoration: BoxDecoration(
        color: AppColors.secondColor,
        borderRadius: BorderRadius.circular(AppLayout.borderRadius * 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _actionList.map((value) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: AppLayout.paddingSmall.verticalPadding,
              child: Row(
                children: [
                  Icon(value.icon, size: context.iconSize, color: Colors.white),
                  AppLayout.paddingSmall.widthBox,
                  Expanded(child: Text(value.title)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
