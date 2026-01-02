import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/home/widget/home_header.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/home/widget/wallet_price_alterts.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/home/widget/wallet_treading.dart';

class WalletHomePage extends StatefulWidget {
  const WalletHomePage({super.key});

  @override
  State<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends State<WalletHomePage> {
  final List<String> _alertsIcon = [
    Assets.images.web3wallet.walletBitcoin,
    Assets.images.web3wallet.walletNeo,
    Assets.images.web3wallet.walletAchain,
  ];

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(children: [
              HomeHeader(),
              WalletPriceAlterts(alertsIcons: _alertsIcon)
            ]),
          ),
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
        SliverFillRemaining(
          hasScrollBody: false,
          child: WalletTreading(alertsIcons: _alertsIcon),
        )
      ],
    );
  }
}
