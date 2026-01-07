import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/constant/wallet_data.dart';
import 'package:flutter_beautiful_ui/entity/coin_price_alerts.dart';
import 'package:flutter_beautiful_ui/presentation/price_alerts/widget/wallet_alerts_list.dart';
import 'package:flutter_beautiful_ui/presentation/price_alerts/widget/wallet_price_alerts_backgorund.dart';
import 'package:go_router/go_router.dart';

class WalletPriceAlertsPage extends StatelessWidget {
  const WalletPriceAlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    final double h = MediaQuery.sizeOf(context).height;
    final List<CoinPriceAlerts> coinPriceAlerts = [
      bitcoinAlerts,
      neoAlerts,
      achainAlerts,
    ];
    return WalletPriceAlertsBackgorund(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () => context.pop(),
              icon: Icon(Icons.keyboard_arrow_left_outlined),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: h * 0.01,
              ),
              child: Text(
                "Price Alerts",
                style: TextStyle(
                  fontSize: TextTheme.of(context).titleLarge?.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF7F7FA).withAlpha(100),
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.all(horizontalPadding),
              child: Column(
                children: coinPriceAlerts
                    .map((value) => WalletAlertsList(coinPriceAlerts: value))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
