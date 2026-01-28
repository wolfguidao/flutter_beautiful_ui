import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class CusDropdown extends StatefulWidget {
  final GlobalKey childKey;
  final Widget child;
  final List<String> item;
  final String activeValue;
  const CusDropdown({
    super.key,
    required this.childKey,
    required this.item,
    required this.activeValue,
    required this.child,
  });

  @override
  State<CusDropdown> createState() => _CusDropdownState();
}

class _CusDropdownState extends State<CusDropdown> {
  OverlayEntry? _overlayEntry;

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _openDropdown() {
    final RenderBox? renderBox =
        widget.childKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    Offset childOffset = renderBox.globalToLocal(Offset.zero);
    double childWidth = renderBox.size.width;
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return CusDropdownOverlay(
          dyOffset: childOffset.dy.abs(),
          dxOffset: childOffset.dx.abs(),
          activeValue: widget.activeValue,
          item: widget.item,
          onClose: () => _removeOverlay(),
          childWidth: childWidth,
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => _openDropdown(), child: widget.child);
  }
}

class CusDropdownOverlay extends StatefulWidget {
  final VoidCallback onClose;
  final List<String> item;
  final String activeValue;
  final double dyOffset;
  final double dxOffset;
  final double childWidth;
  const CusDropdownOverlay({
    super.key,
    required this.onClose,
    required this.item,
    required this.activeValue,
    required this.dyOffset,
    required this.dxOffset,
    required this.childWidth,
  });

  @override
  State<CusDropdownOverlay> createState() => _CusDropdownOverlayState();
}

class _CusDropdownOverlayState extends State<CusDropdownOverlay> {
  int _hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => widget.onClose(),
              child: ColoredBox(color: Colors.transparent),
            ),
          ),
          Positioned(
            top: widget.dyOffset,
            left: widget.dxOffset,
            child: Container(
              width: widget.childWidth + AppLayout.paddingSmall,
              padding: (AppLayout.paddingSmall / 2).allPadding,
              decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(AppLayout.borderRadius / 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.paddingSmall,
                      vertical: AppLayout.paddingSmall / 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius: BorderRadius.circular(
                        AppLayout.borderRadius / 2,
                      ),
                    ),
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      widget.activeValue,
                      style: TextStyle(
                        fontSize: TextTheme.of(context).labelMedium?.fontSize,
                      ),
                    ),
                  ),
                  Divider(color: AppColor.borderColor),
                  ...List.generate(widget.item.length, (index) {
                    if (widget.item[index] == widget.activeValue) {
                      return SizedBox.shrink();
                    }
                    return MouseRegion(
                      onHover: (_) {
                        setState(() {
                          _hoverIndex = index;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _hoverIndex = -1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.paddingSmall,
                          vertical: AppLayout.paddingSmall / 2,
                        ),
                        decoration: BoxDecoration(
                          color: _hoverIndex == index
                              ? AppColor.backgroundColor
                              : AppColor.secondColor,
                          borderRadius: BorderRadius.circular(
                            AppLayout.borderRadius / 2,
                          ),
                        ),
                        alignment: AlignmentGeometry.centerLeft,
                        child: Text(
                          widget.item[index],
                          style: TextStyle(
                            fontSize: TextTheme.of(
                              context,
                            ).labelMedium?.fontSize,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
