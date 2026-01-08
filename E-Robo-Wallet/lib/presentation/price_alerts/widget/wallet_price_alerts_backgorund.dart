import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/widget/blur_color_widget.dart';

class WalletPriceAlertsBackgorund extends StatelessWidget {
  final Widget child;
  const WalletPriceAlertsBackgorund({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f5f6),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              right: -30,
              child: BlurColorWidget(size: 150, color: Color(0xffFFC2C6)),
            ),
            Positioned(
              top: -50,
              right: 100,
              child: BlurColorWidget(
                size: 210,
                color: Color(0xffE8D5FF),
                blurRadius: 120,
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}