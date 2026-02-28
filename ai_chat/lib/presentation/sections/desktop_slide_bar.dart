import 'package:ai_chat/constant/app_extension.dart';
import 'package:ai_chat/constant/app_style.dart';
import 'package:flutter/material.dart';

class DesktopSlideBar extends StatefulWidget {
  const DesktopSlideBar({super.key});

  @override
  State<DesktopSlideBar> createState() => _DesktopSlideBarState();
}

class _DesktopSlideBarState extends State<DesktopSlideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppLayout.paddingLarge.allPadding,
      width: context.width * 0.2,
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        border: Border(right: BorderSide(color: Colors.white)),
      ),
      child: Column(
        children: [
          Row(children: [Text("Gemini UI", style: AppTextStyle.h1)]),
        ],
      ),
    );
  }
}
