import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:e_robo_wallet/constant/wallet_color.dart';
import 'package:e_robo_wallet/entity/coin.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class WalletMarketTrendList extends StatefulWidget {
  final List<Coin> coinList;
  const WalletMarketTrendList({super.key, required this.coinList});

  @override
  State<WalletMarketTrendList> createState() => _WalletMarketTrendListState();
}

class _WalletMarketTrendListState extends State<WalletMarketTrendList>
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
    return SliverList.builder(
      itemCount: widget.coinList.length,
      itemBuilder: (context, index) {
        final Animation<double> animation = CurvedAnimation(
          parent: controller,
          curve: Interval(
            1 / widget.coinList.length * index,
            1 / widget.coinList.length * (index + 1),
          ),
        );
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final double dy = Tween<double>(
              begin: 20,
              end: 0,
            ).evaluate(animation);
            return Transform.translate(
              offset: Offset(0, dy),
              child: Opacity(opacity: animation.value, child: child),
            );
          },
          child: MoneyTrendItem(coin: widget.coinList[index]),
        );
      },
    );
  }
}

class MoneyTrendItem extends StatelessWidget {
  final Coin coin;

  const MoneyTrendItem({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: () => context.push("/coin/detail"),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: horizontalPadding,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: WalletColor.moneyIconColor[coin.icon],
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(coin.icon, width: w * 0.06),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: TextTheme.of(context).bodyLarge?.fontSize,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            coin.changePercent > 0
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: coin.changePercent > 0
                                ? Color(0xff5FC88F)
                                : Color(0xffFF6464),
                          ),
                        ),
                        TextSpan(
                          text: "${coin.changePercent.abs()}%",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: h * 0.03,
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
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    lineTouchData: LineTouchData(enabled: false),
                    lineBarsData: [
                      LineChartBarData(
                        dotData: const FlDotData(show: false),
                        spots: coin.chartSpot["24H"]??[],
                        isCurved: true,
                        color: Color(0xffFF6464),
                        barWidth: 3,
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  coin.price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TextTheme.of(context).bodyLarge?.fontSize,
                  ),
                ),
                Text(
                  coin.mCap,
                  style: TextStyle(
                    fontSize: TextTheme.of(context).bodySmall?.fontSize,
                    color: Color(0xff9395A4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
