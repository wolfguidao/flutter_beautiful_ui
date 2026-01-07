import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/entity/coin.dart';

class WalletCointTrendChart extends StatefulWidget {
  final Coin coin;
  const WalletCointTrendChart({super.key, required this.coin});

  @override
  State<WalletCointTrendChart> createState() => _WalletCointTrendChartState();
}

class _WalletCointTrendChartState extends State<WalletCointTrendChart> {
  int _activeTimeIndex = 0;
  final List<String> _timeRange = ["24H", "1W", "1Y", "ALL", "Point"];
  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            Text(
              "\$32,128.80",
              style: TextStyle(
                fontSize: TextTheme.of(context).titleLarge?.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      widget.coin.changePercent > 0
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: widget.coin.changePercent > 0
                          ? Color(0xff5FC88F)
                          : Color(0xffFF6464),
                    ),
                  ),
                  TextSpan(
                    text: "${widget.coin.changePercent.abs()}%",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              width: w,
              height: h * 0.065,
              decoration: BoxDecoration(
                color: Color(0xffEBEFF1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      top: 5,
                      bottom: 5,
                      left:
                          5 +
                          _activeTimeIndex *
                              (w - 2 * horizontalPadding - 10) /
                              _timeRange.length,
                      child: Container(
                        width:
                            (w - 2 * horizontalPadding - 10) /
                            _timeRange.length,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(70),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(_timeRange.length, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _activeTimeIndex = index;
                            });
                          },
                          child: SizedBox(
                            width:
                                (w - 2 * horizontalPadding - 10) /
                                _timeRange.length,
                            child: Center(
                              child: AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 500),
                                style: TextStyle(
                                  color: _activeTimeIndex == index
                                      ? Colors.black
                                      : Color(0xff9395A5),
                                  fontWeight: FontWeight.bold,
                                ),
                                child: Text(_timeRange[index]),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: h * 0.05),
              height: h * 0.3,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(show: true, drawVerticalLine: false),
                  borderData: FlBorderData(show: false),
                  lineTouchData: LineTouchData(enabled: false),
                  lineBarsData: [
                    LineChartBarData(
                      dotData: const FlDotData(show: false),
                      spots:
                          widget.coin.chartSpot[_timeRange[_activeTimeIndex]] ??
                          [],
                      isCurved: true,
                      color: Color(0xffF04086),
                      barWidth: 6,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    foregroundColor: Color(0xff767DFF),
                    minimumSize: Size(w * 0.4, h * 0.06),
                  ),
                  onPressed: () {},
                  child: Text("Set Alert"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    foregroundColor: Colors.white,
                    minimumSize: Size(w * 0.4, h * 0.06),
                  ),
                  onPressed: () {},
                  child: Text("Buy Now"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
