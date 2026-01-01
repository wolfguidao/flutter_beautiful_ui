import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';
import 'package:flutter_beautiful_ui/web3wallet/WalletColor.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  int _alertsNotFoldCount = 0;

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
                height: h * 0.15,
                width: w,
                margin: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: h * 0.02,
                ),
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
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: h * 0.02,
            ),
            child: Text(
              "Price Alerts",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: TextTheme.of(context).titleMedium?.fontSize,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                ...List<Widget>.generate(_alertsIcon.length, (index) {
                  return Padding(
                    padding:EdgeInsets.only(bottom: h*0.01),
                    child: PriceAlertsWidget(
                        onChangeFold: (value) {
                          setState(() {
                            if (value) {
                              _alertsNotFoldCount--;
                            } else {
                              _alertsNotFoldCount++;
                            }
                          });
                        },
                        icon: _alertsIcon[index],
                        text: "BTCUSDT just went above\n30123.232",
                      ),
                  );
                }).reversed,
              ],
            ),
          ),
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            padding: EdgeInsets.all(horizontalPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Treading",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TextTheme.of(context).titleMedium?.fontSize,
                  ),
                ),
                SizedBox(height: h * 0.025),
                ..._alertsIcon.map((icon) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: h * 0.02),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(right: w * 0.04),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Walletcolor.moneyIconColor[icon],
                          ),
                          child: SvgPicture.asset(icon),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bitcoin",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "BTC",
                                style: TextStyle(
                                  fontSize: TextTheme.of(
                                    context,
                                  ).bodySmall?.fontSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$32,128.80",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "2.5%",
                              style: TextStyle(
                                fontSize: TextTheme.of(
                                  context,
                                ).bodySmall?.fontSize,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(height: h * 0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PriceAlertsWidget extends StatefulWidget {
  final String icon;
  final String text;
  final ValueChanged<bool> onChangeFold;
  const PriceAlertsWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onChangeFold,
  });

  @override
  State<PriceAlertsWidget> createState() => _PriceAlertsWidgetState();
}

class _PriceAlertsWidgetState extends State<PriceAlertsWidget> {
  bool _isFolded = true;

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.all(w * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Walletcolor.moneyIconColor[widget.icon],
                ),
                child: SvgPicture.asset(widget.icon),
              ),
              Expanded(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w*0.04),
                child: Text(widget.text, style: TextStyle(fontWeight: FontWeight.w600)),
              )),
              AnimatedRotation(
                turns: _isFolded ? 0.25 : 0,
                duration: Duration(milliseconds: 500),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isFolded = !_isFolded;
                    });
                    widget.onChangeFold(_isFolded);
                  },
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: _isFolded ? Color(0xffCED0DE) : Color(0xffF7931A),
                  ),
                ),
              ),
            ],
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: _isFolded
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      Divider(color: Color(0xffE5E7F3)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(onPressed: () {}, child: Text("Buy")),
                          TextButton(onPressed: () {}, child: Text("Sell")),
                          TextButton(onPressed: () {}, child: Text("More")),
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
