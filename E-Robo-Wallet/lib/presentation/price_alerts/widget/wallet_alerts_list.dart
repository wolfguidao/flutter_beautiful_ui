import 'package:flutter/material.dart';
import 'package:e_robo_wallet/constant/wallet_color.dart';
import 'package:e_robo_wallet/constant/wallet_data.dart';
import 'package:e_robo_wallet/entity/coin_price_alerts.dart';
import 'package:flutter_svg/svg.dart';

class WalletAlertsList extends StatefulWidget {
  const WalletAlertsList({super.key});

  @override
  State<WalletAlertsList> createState() => _WalletAlertsListState();
}

class _WalletAlertsListState extends State<WalletAlertsList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final List<CoinPriceAlerts> _coinPriceAlerts = [
    bitcoinAlerts,
    neoAlerts,
    achainAlerts,
  ];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF7F7FA).withAlpha(100),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.all(horizontalPadding),
        child: Column(
          children: List<Widget>.generate(_coinPriceAlerts.length, (index) {
            final Animation animation = CurvedAnimation(
              parent: _controller,
              curve: Interval(
                1 / _coinPriceAlerts.length * index,
                1 / _coinPriceAlerts.length * (1 + index),
              ),
            );
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(20.0*(1-animation.value), 0),
                  child: Opacity(opacity: animation.value, child: child),
                );
              },
              child: AlertsItem(coinPriceAlerts: _coinPriceAlerts[index]),
            );
          }),
        ),
      ),
    );
  }
}

class AlertsItem extends StatelessWidget {
  final CoinPriceAlerts coinPriceAlerts;
  const AlertsItem({super.key, required this.coinPriceAlerts});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: WalletColor.moneyIconColor[coinPriceAlerts.coin.icon],
            ),
            child: SvgPicture.asset(coinPriceAlerts.coin.icon),
          ),
          title: Text(
            "${coinPriceAlerts.coin.name} ${coinPriceAlerts.coin.symble}",
            style: TextStyle(
              fontSize: TextTheme.of(context).titleMedium?.fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.blue),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: coinPriceAlerts.priceAlerts.map((value) {
              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: value.amount > 0
                        ? Color(0xffDEF5E9)
                        : Color(0xffFFDBDB),
                  ),
                  child: Icon(
                    value.amount > 0
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: value.amount > 0
                        ? Color(0xff5FC88F)
                        : Color(0xffFF6464),
                    size: w * 0.08,
                  ),
                ),
                title: Text(
                  value.amount > 0
                      ? "Above \$${value.amount.abs()}"
                      : "Below \$${value.amount.abs()}",
                  style: TextStyle(
                    fontSize: TextTheme.of(context).bodyMedium?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  value.time,
                  style: TextStyle(
                    fontSize: TextTheme.of(context).bodySmall?.fontSize,
                  ),
                ),
                trailing: Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    activeThumbColor: Colors.white,
                    activeTrackColor: Color(0xff767DFF),
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
