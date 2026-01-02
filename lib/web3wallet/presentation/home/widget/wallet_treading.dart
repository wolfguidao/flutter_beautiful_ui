import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/web3wallet/WalletColor.dart';
import 'package:flutter_svg/svg.dart';

class WalletTreading extends StatefulWidget {
  final List<String> alertsIcons;
  const WalletTreading({super.key, required this.alertsIcons});

  @override
  State<WalletTreading> createState() => _WalletTreadingState();
}

class _WalletTreadingState extends State<WalletTreading>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    final double horizontalPadding = w * 0.05;
    return Container(
      padding: EdgeInsets.all(horizontalPadding),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(140),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Treading",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: TextTheme.of(context).titleMedium?.fontSize,
            ),
          ),
          SizedBox(height: h * 0.025),
          ...List<Widget>.generate(widget.alertsIcons.length, (index) {
            final Animation<double> animation = CurvedAnimation(
              parent: controller,
              curve: Interval(
                (1 / widget.alertsIcons.length) * index,
                (1 / widget.alertsIcons.length) * (index + 1),
              ),
            );
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                final double dx = Tween<double>(
                  begin: 50,
                  end: 0,
                ).evaluate(animation);
                return Transform.translate(
                  offset: Offset(dx, 0),
                  child: Opacity(opacity: animation.value, child: child),
                );
              },
              child: TreadingItem(icon: widget.alertsIcons[index]),
            );
          }),
          SizedBox(height: h * 0.1),
        ],
      ),
    );
  }
}

class TreadingItem extends StatelessWidget {
  final String icon;
  const TreadingItem({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.02),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(right: w * 0.04),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Walletcolor.moneyIconColor[icon],
            ),
            child: SvgPicture.asset(icon),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bitcoin", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "BTC",
                  style: TextStyle(
                    fontSize: TextTheme.of(context).bodySmall?.fontSize,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$32,128.80",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "2.5%",
                style: TextStyle(
                  fontSize: TextTheme.of(context).bodySmall?.fontSize,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
