import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/constant/wallet_color.dart';
import 'package:flutter_beautiful_ui/entity/coin_price_alerts.dart';
import 'package:flutter_svg/svg.dart';

class WalletAlertsList extends StatefulWidget {
  final CoinPriceAlerts coinPriceAlerts;

  const WalletAlertsList({super.key, required this.coinPriceAlerts});

  @override
  State<WalletAlertsList> createState() => _WalletAlertsListState();
}

class _WalletAlertsListState extends State<WalletAlertsList> {
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
              color:
                  WalletColor.moneyIconColor[widget.coinPriceAlerts.coin.icon],
            ),
            child: SvgPicture.asset(widget.coinPriceAlerts.coin.icon),
          ),
          title: Text(
            "${widget.coinPriceAlerts.coin.name} ${widget.coinPriceAlerts.coin.symble}",
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
            children: widget.coinPriceAlerts.priceAlerts.map((value) {
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
