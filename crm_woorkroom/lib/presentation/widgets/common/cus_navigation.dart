import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CusNavigationItem {
  final String text;
  final String icon;

  CusNavigationItem({required this.text, required this.icon});
}

class CusNavigation extends StatefulWidget {
  final List<CusNavigationItem> items;
  final int activeIndex;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? backgroundColor;
  final ValueChanged<int> onChanged;
  const CusNavigation({
    super.key,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
    required this.items,
    required this.activeIndex,
    required this.onChanged,
  });

  @override
  State<CusNavigation> createState() => _CusNavigationState();
}

class _CusNavigationState extends State<CusNavigation> {
  late final Color _activeColor;
  late final Color _inactiveColor;
  late final Color _backgroundColor;
  late int _activeIndex;

  @override
  void initState() {
    _activeColor = widget.activeColor ?? AppColor.primaryColor;
    _inactiveColor = widget.inactiveColor ?? AppColor.hintColor;
    _backgroundColor = widget.backgroundColor ?? Color(0xffECF3FF);
    _activeIndex = widget.activeIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.items.length, (index) {
        final CusNavigationItem item = widget.items[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              _activeIndex = index;
            });
            widget.onChanged(index);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: (AppLayout.paddingSmall * 0.75).allPadding,
                  margin: AppLayout.paddingSmall.horizontalPadding,
                  decoration: BoxDecoration(
                    color: _activeIndex == index
                        ? _backgroundColor
                        : AppColor.secondColor,
                    borderRadius: BorderRadius.circular(
                      AppLayout.borderRadius * 0.75,
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        item.icon,
                        colorFilter: ColorFilter.mode(
                          _activeIndex == index ? _activeColor : _inactiveColor,
                          BlendMode.srcIn,
                        ),
                        width: 15,
                      ),
                      AppLayout.paddingSmall.widthBox,
                      Text(
                        item.text,
                        style: TextStyle(
                          color: _activeIndex == index
                              ? _activeColor
                              : _inactiveColor,
                          fontSize: TextTheme.of(context).labelMedium?.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 3,
                height: 25,
                padding: AppLayout.paddingSmall.horizontalPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppLayout.borderRadius * 10,
                  ),
                  color: _activeIndex == index
                      ? _activeColor
                      : AppColor.secondColor,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
