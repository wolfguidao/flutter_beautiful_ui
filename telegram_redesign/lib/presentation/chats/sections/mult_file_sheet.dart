import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/presentation/chats/sections/gallery_selected.dart';

class MultFileChoice {
  final String text;
  final IconData icon;
  final Widget widget;

  MultFileChoice({
    required this.text,
    required this.icon,
    required this.widget,
  });
}

class MultFileSheet extends StatefulWidget {
  const MultFileSheet({super.key});

  @override
  State<MultFileSheet> createState() => _MultFileSheetState();
}

class _MultFileSheetState extends State<MultFileSheet> {
  final List<MultFileChoice> _choices = [
    MultFileChoice(
      text: 'Gallery',
      icon: Icons.image,
      widget: const SizedBox(),
    ),
    MultFileChoice(
      text: 'File',
      icon: Icons.file_copy,
      widget: const SizedBox(),
    ),
    MultFileChoice(
      text: 'Contact',
      icon: Icons.person,
      widget: const SizedBox(),
    ),
    MultFileChoice(
      text: 'Music',
      icon: Icons.music_note,
      widget: const SizedBox(),
    ),
  ];

  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondColor,
          borderRadius: BorderRadius.circular(AppLayout.borderRadius * 2),
        ),
        child: Column(
          children: [
            Container(
              width: context.screenWidth * 0.1,
              height: 5,
              margin: EdgeInsets.only(top: AppLayout.paddingSmall),
              decoration: BoxDecoration(
                color: Color(0xff2F3D43),
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
              ),
            ),
            Expanded(
              child: Padding(
                padding: AppLayout.paddingSmall.verticalPadding,
                child: GallerySelected(),
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.08,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                scrollDirection: Axis.vertical,
                itemCount: _choices.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final MultFileChoice choice = _choices[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _activeIndex = index;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: AppLayout.paddingSmall.allPadding,
                          decoration: BoxDecoration(
                            color: _activeIndex == index
                                ? AppColors.primaryColor
                                : AppColors.backgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              choice.icon,
                              color: _activeIndex == index
                                  ? Colors.white
                                  : AppColors.hintTextColor,
                            ),
                          ),
                        ),
                        (AppLayout.paddingSmall / 2).heightBox,
                        Text(
                          choice.text,
                          style: TextStyle(
                            color: _activeIndex == index
                                ? AppColors.primaryColor
                                : AppColors.hintTextColor,
                            fontSize: context.textTheme.labelMedium?.fontSize,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: AppLayout.paddingSmall.horizontalPadding,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Add a Caption"),
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
