import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatInputArea extends StatefulWidget {
  const ChatInputArea({super.key});

  @override
  State<ChatInputArea> createState() => _ChatInputAreaState();
}

class _ChatInputAreaState extends State<ChatInputArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 2.allPadding,
      margin: AppLayout.paddingMedium.allPadding,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderColor),
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.images.attach, width: 20),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.images.addlink, width: 20),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.images.mention, width: 20),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: TextTheme.of(context).labelMedium?.fontSize,
              ),
              maxLines: 3,
              minLines: 1,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Type your message here ...",
                hintStyle: TextStyle(
                  fontSize: TextTheme.of(context).labelMedium?.fontSize,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.images.emoji, width: 20),
          ),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              minimumSize: Size(45, 30),
              maximumSize: Size(45, 30),
            ),
            icon: SvgPicture.asset(Assets.images.send, width: 20),
          ),
        ],
      ),
    );
  }
}
