import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/entity/coin.dart';

class WalletMarketStatistic extends StatelessWidget {
  final Coin coin;
  const WalletMarketStatistic({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    final double h = MediaQuery.sizeOf(context).height;
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        margin: EdgeInsets.only(top: h * 0.02),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(140),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Market Statistic",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: TextTheme.of(context).titleLarge?.fontSize,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: h * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Market capitalization",
                    style: TextStyle(
                      color: Color(0xff9395A4),
                      fontSize: TextTheme.of(context).bodyLarge?.fontSize,
                    ),
                  ),
                  Text(
                    coin.capitalization,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: TextTheme.of(context).bodyLarge?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: h * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Circulating Suply",
                    style: TextStyle(
                      color: Color(0xff9395A4),
                      fontSize: TextTheme.of(context).bodyLarge?.fontSize,
                    ),
                  ),
                  Text(
                    "${coin.suply} ETH",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: TextTheme.of(context).bodyLarge?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
