import 'package:flutter/material.dart';
import 'package:e_robo_wallet/constant/wallet_data.dart';
import 'package:e_robo_wallet/presentation/insights/widget/wallet_news_list.dart';
import 'package:e_robo_wallet/presentation/insights/widget/wallet_top_news.dart';

class WalletInSightsPage extends StatelessWidget {
  const WalletInSightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Insights",
                style: TextStyle(
                  fontSize: TextTheme.of(context).titleLarge?.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                icon: Icon(Icons.more_horiz_outlined),
              ),
            ],
          ),
        ),
        WalletTopNews(coinNews: neoNews),
        WalletNewsList(coinNews: bitcoinNews),
        WalletNewsList(coinNews: achainNews),
      ],
    );
  }
}
