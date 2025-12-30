import 'package:flutter/material.dart';

class WalletBottomNavigation extends StatelessWidget {
  final List<Widget> navItems;
  final ValueChanged<int> onNavChanged;
  const WalletBottomNavigation({
    super.key,
    required this.navItems,
    required this.onNavChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return Container(
      width: w,
      height: h * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<Widget>.generate(navItems.length, (index) {
          return InkWell(
            onTap: () => onNavChanged(index),
            child: navItems[index],
          );
        }),
      ),
    );
  }
}
