import 'package:flutter/material.dart';
import 'package:music_demo/core/config/size_config.dart';

extension ResponsiveContext on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
}

extension SizeExtension on num {
  double get w => this * SizeConfig.w;
  double get h => this * SizeConfig.h;
  double get sp => SizeConfig.sp(toDouble());
}
