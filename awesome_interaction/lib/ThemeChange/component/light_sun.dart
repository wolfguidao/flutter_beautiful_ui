import 'dart:math' as math;

import 'package:awesome_interaction/ThemeChange/theme_color.dart';
import 'package:awesome_interaction/ThemeChange/widget/cloud_painter.dart';
import 'package:awesome_interaction/ThemeChange/widget/light_painter.dart';
import 'package:awesome_interaction/ThemeChange/widget/sun_painter.dart';
import 'package:flutter/material.dart';

class LightSun extends StatefulWidget {
  final Animation animation;
  const LightSun({super.key, required this.animation});

  @override
  State<LightSun> createState() => _LightSunState();
}

class _LightSunState extends State<LightSun> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...List.generate(ThemeColor.sunlightColor.length, (index) {
          return Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: AnimatedBuilder(
              animation: widget.animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(-100.0 * (1 - widget.animation.value), 0),
                  child: Opacity(opacity: widget.animation.value, child: child),
                );
              },
              child: CustomPaint(
                size: Size.square(380 - index * 65),
                painter: LightPainter(
                  centerRate: 0.2,
                  color: ThemeColor.sunlightColor[index],
                ),
              ),
            ),
          );
        }),
        Positioned(
          top: 0,
          bottom: 0,
          child: AnimatedBuilder(
            animation: widget.animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(100.0 * (1 - widget.animation.value), 0),
                child: Opacity(opacity: widget.animation.value, child: child),
              );
            },
            child: CustomPaint(
              size: Size(240, 200),
              painter: CloudPainter(
                cloudColor: ThemeColor.cloudColor[0],
                offset: Offset(-30, -20),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          child: AnimatedBuilder(
            animation: widget.animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(100.0 * (1 - widget.animation.value), 0),
                child: Opacity(opacity: widget.animation.value, child: child),
              );
            },
            child: CustomPaint(
              size: Size(240, 200),
              painter: CloudPainter(
                cloudColor: ThemeColor.cloudColor[1],
                offset: Offset.zero,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 10,
          child: AnimatedBuilder(
            animation: widget.animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(100.0 * (1 - widget.animation.value), 0),
                child: Transform.rotate(
                  angle: -math.pi * widget.animation.value,
                  child: Opacity(opacity:widget.animation.value, child: child),
                ),
              );
            },
            child: Center(
              child: CustomPaint(
                size: Size(80, 80),
                painter: SunPainter(
                  sunColor: ThemeColor.sunColor,
                  sunShadowColor: ThemeColor.sunShadowColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
