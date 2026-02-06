import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/gen/assets.gen.dart';
import 'package:telegram_redesign/widgets/cus_circle_avatar.dart';

class HomeNavigation extends StatefulWidget {
  final Color? activeColor;
  final Color? defaultColor;
  final int activeIndex;
  final ValueChanged onChanged;
  const HomeNavigation({
    super.key,
    this.activeColor,
    this.defaultColor,
    required this.activeIndex,
    required this.onChanged,
  });

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  final List<CusNavigationItem> _navItem = [
    CusNavigationItem(text: "Calls", iconPath: Assets.images.calls),
    CusNavigationItem(text: "Contacts", iconPath: Assets.images.contacts),
    CusNavigationItem(text: "Chats", iconPath: Assets.images.chats),
    CusNavigationItem(text: "Setting", iconPath: Assets.images.avatar.path),
  ];

  late Color _activeColor;
  late Color _defaultColor;

  @override
  void initState() {
    _activeColor = widget.activeColor ?? AppColors.primaryColor;
    _defaultColor = widget.defaultColor ?? AppColors.hintTextColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: context.screenHeight * 0.07,
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: List.generate(_navItem.length, (index) {
            final CusNavigationItem item = _navItem[index];
            return Expanded(
              flex: 1,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  widget.onChanged(index);
                },
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      height: 30,
                      padding: index != _navItem.length - 1
                          ? EdgeInsets.symmetric(
                              horizontal: context.screenWidth * 0.025,
                              vertical: 2,
                            )
                          : EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color:
                            (index != _navItem.length - 1 &&
                                widget.activeIndex == index)
                            ? AppColors.backgroundColor
                            : null,
                        borderRadius: BorderRadius.circular(
                          AppLayout.borderRadius * 2,
                        ),
                      ),
                      child: index == _navItem.length - 1
                          ? CusCircleAvatar(avatar: item.iconPath, size: 30)
                          : SvgPicture.asset(
                              item.iconPath,
                              colorFilter: ColorFilter.mode(
                                widget.activeIndex == index
                                    ? _activeColor
                                    : _defaultColor,
                                BlendMode.srcIn,
                              ),
                            ),
                    ),
                    Text(
                      item.text,
                      style: TextStyle(
                        fontSize: context.textTheme.bodySmall?.fontSize,
                        color: widget.activeIndex == index
                            ? _activeColor
                            : _defaultColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class CusNavigationItem {
  String text;
  String iconPath;
  CusNavigationItem({required this.text, required this.iconPath});
}
