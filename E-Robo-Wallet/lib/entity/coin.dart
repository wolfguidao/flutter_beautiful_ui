// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';

class Coin {
  String name;
  String symble;
  String icon;
  String price;
  double changePercent;
  Map<String, List<FlSpot>> chartSpot;
  String mCap;
  String capitalization;
  double suply;
  Coin({
    required this.name,
    required this.symble,
    required this.icon,
    required this.price,
    required this.changePercent,
    required this.chartSpot,
    required this.mCap,
    required this.capitalization,
    required this.suply,
  });
}
