import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';
import 'package:flutter_beautiful_ui/web3wallet/wallet_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletInSightsPage extends StatefulWidget {
  const WalletInSightsPage({super.key});

  @override
  State<WalletInSightsPage> createState() => _WalletInSightsPageState();
}

class _WalletInSightsPageState extends State<WalletInSightsPage> {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.sizeOf(context).height;
    final double w = MediaQuery.sizeOf(context).width;
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
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
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color:
                          WalletColor.moneyIconColor[Assets
                              .images
                              .web3wallet
                              .walletAchain],
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      Assets.images.web3wallet.walletAchain,
                    ),
                  ),
                  title: Text(
                    "Achain news",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(color: Color(0xff767DFF)),
                    ),
                  ),
                ),
                Image.asset(
                  width: w,
                  Assets.images.web3wallet.walletInsightsRobot.path,
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Participate in the Corra Finance Airdrop on CoinMarketCap",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Color(0xff9395A4)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "3 days ago",
                        style: TextStyle(
                          fontSize: TextTheme.of(context).bodySmall?.fontSize,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff9395A4),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: WalletColor
                      .moneyIconColor[Assets.images.web3wallet.walletBitcoin],
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(Assets.images.web3wallet.walletBitcoin),
              ),
              title: Text(
                "Bitcoin news",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: TextStyle(color: Color(0xff767DFF)),
                ),
              ),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: h * 0.01,
              ),
              child: Row(
                children: [
                  Container(
                    width: w * 0.3,
                    height: w * 0.3,
                    margin: EdgeInsets.only(right: w * 0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff9F9DF3),
                    ),
                    child: Align(
                      alignment: AlignmentGeometry.bottomCenter,
                      child: Image.asset(
                        width: w,
                        Assets.images.web3wallet.walletNewsImage.path,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Participate in the Corra Finance Airdrop on CoinMarketCap",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Color(0xff9395A4)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "3 days ago",
                                style: TextStyle(
                                  fontSize: TextTheme.of(
                                    context,
                                  ).bodySmall?.fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff9395A4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
