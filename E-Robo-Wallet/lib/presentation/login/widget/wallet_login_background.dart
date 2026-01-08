import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/widget/blur_color_widget.dart';

class WalletLoginBackground extends StatelessWidget {
  final Widget child;
  const WalletLoginBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            bottom: 50,
            left: -160,
            child: BlurColorWidget(size: 231, color: Color(0xfff3e9ff)),
          ),
          Positioned(
            bottom: 20,
            right: -100,
            child: BlurColorWidget(size: 145, color: Color(0xffffe3c9)),
          ),
          Positioned(
            bottom: -120,
            right: -50,
            child: BlurColorWidget(size: 153, color: Color(0xffffc2c6)),
          ),
          child,
        ],
      ),
    );
  }
}
