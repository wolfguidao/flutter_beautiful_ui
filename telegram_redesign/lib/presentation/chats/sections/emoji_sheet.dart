import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_globals.dart';
import 'package:telegram_redesign/constant/app_layout.dart';

class EmojiSheet extends StatefulWidget {
  const EmojiSheet({super.key});

  @override
  State<EmojiSheet> createState() => _EmojiSheetState();
}

class _EmojiSheetState extends State<EmojiSheet> {
  String _activeKey = "people";
  final Map<String, IconData> _emojiType = {
    "people": Icons.emoji_emotions_outlined,
    "animal": Icons.cruelty_free_outlined,
    "fruit": Icons.apple_outlined,
    "sport": Icons.sports_outlined,
    "car": Icons.car_repair_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: context.screenHeight * 0.5),
      padding: AppLayout.paddingSmall.allPadding,
      decoration: BoxDecoration(
        color: AppColors.secondColor,
        borderRadius: BorderRadius.circular(AppLayout.borderRadius * 2),
      ),
      child: Column(
        children: [
          Container(
            width: context.screenWidth * 0.1,
            height: 5,
            decoration: BoxDecoration(
              color: Color(0xff2F3D43),
              borderRadius: BorderRadius.circular(AppLayout.borderRadius),
            ),
          ),
          Row(
            children: _emojiType.keys.map((key) {
              return IconButton(
                style: IconButton.styleFrom(
                  foregroundColor: key == _activeKey
                      ? AppColors.hintTextColor
                      : Color(0xff2F3D43),
                ),
                onPressed: () {
                  setState(() {
                    _activeKey = key;
                  });
                },
                icon: Icon(_emojiType[key]),
              );
            }).toList(),
          ),
          TextField(
            style: context.textTheme.bodySmall,
            decoration: InputDecoration(hintText: "Search"),
          ),
          Padding(
            padding: AppLayout.paddingSmall.verticalPadding,
            child: Text(
              "Hold emoji to send a super reaction",
              style: context.textTheme.labelMedium,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: AppGlobals.categorizedEmojis[_activeKey]?.length,
              itemBuilder: (context, index) {
                final String emoji =
                    AppGlobals.categorizedEmojis[_activeKey]![index];
                return Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      emoji,
                      style: TextStyle(fontSize: context.screenWidth * 0.07),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
