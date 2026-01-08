import 'package:flutter/material.dart';
import 'package:e_robo_wallet/constant/wallet_data.dart';
import 'package:e_robo_wallet/presentation/coin_detail/widget/wallet_coin_detail_background.dart';
import 'package:e_robo_wallet/presentation/coin_detail/widget/wallet_coin_trend_chart.dart';
import 'package:e_robo_wallet/presentation/coin_detail/widget/wallet_market_statistic.dart';
import 'package:go_router/go_router.dart';

class WalletCoinDetailPage extends StatelessWidget {
  const WalletCoinDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WalletCoinDetailBackground(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () => context.pop(),
              icon: Icon(Icons.keyboard_arrow_left_outlined),
            ),
            actions: [
              IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                icon: Icon(Icons.more_horiz_outlined),
              ),
            ],
            title: Text(
              "Etherium(ETH)",
              style: TextStyle(
                fontSize: TextTheme.of(context).titleMedium?.fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          WalletCointTrendChart(coin: bitcoin),
          WalletMarketStatistic(coin: bitcoin),
        ],
      ),
    );
  }
}
