import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class CusAnimatedSwitch extends StatefulWidget {
  final double width;
  final List<String> items;
  final String active;
  final ValueChanged<String> onChanged;
  const CusAnimatedSwitch({
    super.key,
    required this.width,
    required this.items,
    required this.active,
    required this.onChanged,
  });

  @override
  State<CusAnimatedSwitch> createState() => _CusAnimatedSwitchState();
}

class _CusAnimatedSwitchState extends State<CusAnimatedSwitch> {
  late double _totalWidth;
  late double horizontalPadding;
  late double trackWidth;
  late double itemWidth;
  late String _active;

  @override
  void initState() {
    _totalWidth = widget.width;
    horizontalPadding = AppLayout.paddingSmall * 0.3;
    trackWidth = _totalWidth - (horizontalPadding * 2);
    itemWidth = trackWidth / widget.items.length;
    _active = widget.active;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _totalWidth,
      height: 35,
      decoration: BoxDecoration(
        color: Color(0xffE6EDF5),
        borderRadius: BorderRadius.circular(AppLayout.borderRadius * 10),
      ),
      padding: horizontalPadding.allPadding,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: 0,
            bottom: 0,
            left: widget.items.indexOf(_active) * itemWidth,
            child: Container(
              width: itemWidth,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(
                  AppLayout.borderRadius * 10,
                ),
              ),
            ),
          ),
          Row(
            children: widget.items.map((item) {
              return Expanded(
                flex: 1,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    widget.onChanged(item);
                    setState(() {
                      _active = item;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: Theme.of(
                          context,
                        ).textTheme.labelMedium?.fontSize,
                        color: _active == item ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
