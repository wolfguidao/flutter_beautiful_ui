import 'package:ai_chat/constant/app_extension.dart';
import 'package:ai_chat/presentation/sections/chat_area.dart';
import 'package:ai_chat/presentation/sections/desktop_slide_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          context.isMobile ? SizedBox.shrink() : DesktopSlideBar(),
          Expanded(child: ChatArea()),
        ],
      ),
    );
  }
}
