import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';
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
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    final double horizontalPadding = w * 0.05;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          titleSpacing: horizontalPadding,
          backgroundColor: Colors.transparent,
          title: Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: false,
        ),
        SliverToBoxAdapter(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: h * 0.01,
                ),
                height: h * 0.15,
                width: w,
                decoration: BoxDecoration(
                  color: Color(0xff9F9DF3),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(w * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Try our AI for avoid \n huge loss",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: TextTheme.of(context).titleMedium?.fontSize,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        minimumSize: Size(w * 0.25, h / 28),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Try Now",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: -h * 0.015,
                child: Image.asset(
                  Assets.images.web3wallet.walletHomeRobot.path,
                  width: w * 0.45,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: WalletPriceAlterts(alertsIcons: _alertsIcon),
          ),
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
        SliverFillRemaining(
          hasScrollBody: false,
          child: WalletTreading(alertsIcons: _alertsIcon),
        ),
      ],
    );
  }
}
