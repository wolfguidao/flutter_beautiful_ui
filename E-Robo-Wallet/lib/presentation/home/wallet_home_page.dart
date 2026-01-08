import 'package:flutter/material.dart';
import 'package:e_robo_wallet/constant/wallet_data.dart';
import 'package:e_robo_wallet/entity/coin.dart';
import 'package:e_robo_wallet/presentation/home/widget/wallet_home_header.dart';
import 'package:e_robo_wallet/presentation/home/widget/wallet_home_price_alterts.dart';
import 'package:e_robo_wallet/presentation/home/widget/wallet_home_treading.dart';

class WalletHomePage extends StatelessWidget {
  const WalletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Coin> coinList=[bitcoin,neo,achain];
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                WalletHomeHeader(),
                WalletHomePriceAlterts(coinList: coinList,),
              ],
            ),
          ),
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
        SliverFillRemaining(
          hasScrollBody: false,
          child: WalletHomeTreading(coinList: coinList),
        ),
      ],
    );
  }
}
