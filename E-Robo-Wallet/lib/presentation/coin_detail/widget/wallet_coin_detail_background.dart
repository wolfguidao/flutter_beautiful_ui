import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/widget/blur_color_widget.dart';

class WalletCoinDetailBackground extends StatelessWidget {
  final Widget child;
  const WalletCoinDetailBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Color(0xfff3f5f6),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              right: -30,
              top: -100,
              child: BlurColorWidget(size: 209, color: Color(0xffFFE3C9)),
            ),
            Positioned(
              left: -100,
              top: h * 0.6,
              child: BlurColorWidget(size: 187, color: Color(0xffFFC2C6)),
            ),
            child
          ],
        ),
      ),
    );
  }
}
