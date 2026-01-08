import 'package:flutter/material.dart';
import 'package:e_robo_wallet/gen/assets.gen.dart';

class WalletHomeHeader extends StatelessWidget {
  const WalletHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: TextTheme.of(context).titleLarge?.fontSize,
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: h * 0.15,
              width: w,
              margin: EdgeInsets.symmetric(vertical: h * 0.01),
              decoration: BoxDecoration(
                color: Color(0xff9F9DF3),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(w * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Try our AI for avoid \n huge loss",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: TextTheme.of(context).titleMedium?.fontSize,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      minimumSize: Size(w * 0.25, h / 28),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Try Now",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: -h * 0.015,
              child: Image.asset(
                Assets.images.walletHomeRobot.path,
                width: w * 0.45,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
