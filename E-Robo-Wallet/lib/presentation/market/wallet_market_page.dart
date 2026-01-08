import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/constant/wallet_data.dart';
import 'package:flutter_beautiful_ui/entity/coin.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';
import 'package:flutter_beautiful_ui/presentation/market/widget/wallet_market_search.dart';
import 'package:flutter_beautiful_ui/presentation/market/widget/wallet_market_trend_list.dart';

class WalletMarketPage extends StatelessWidget {
  const WalletMarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> marketType = {
      Assets.images.walletWahchlists: "Watchlists",
      Assets.images.walletTrending: "Trending",
      Assets.images.walleBest: "Best Value",
    };
    final List<Coin> coinList = [bitcoin, neo, achain];
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          title: Text(
            "Market",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: TextTheme.of(context).titleLarge?.fontSize,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: WalletMarketSearch(marketType: marketType),
          ),
        ),
        WalletMarketTrendList(coinList: coinList),
      ],
    );
  }
}
