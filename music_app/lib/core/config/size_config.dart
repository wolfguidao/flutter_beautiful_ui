import 'package:flutter/material.dart';
import 'package:music_demo/core/extensions/size_extension.dart';

class SizeConfig {
  static late double _widthRatio;
  static late double _heightRatio;
  static late TextScaler textScaler;

  static const double designWidth = 360;
  static const double designHeight = 800;

  static double get w => _widthRatio;
  static double get h => _heightRatio;

  static void init(BuildContext context) {
    _widthRatio = context.screenWidth / designWidth;
    _heightRatio = context.screenHeight / designHeight;
    textScaler = MediaQuery.of(context).textScaler;
  }

  static double sp(double fontSize) {
    return textScaler.scale(fontSize * _widthRatio);
  }
}
