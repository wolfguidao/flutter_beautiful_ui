import 'package:flutter/material.dart';
import 'package:e_robo_wallet/constant/wallet_color.dart';
import 'package:e_robo_wallet/entity/coin.dart';
import 'package:flutter_svg/svg.dart';

class WalletHomeTreading extends StatefulWidget {
  final List<Coin> coinList;
  const WalletHomeTreading({super.key, required this.coinList});

  @override
  State<WalletHomeTreading> createState() => _WalletHomeTreadingState();
}

class _WalletHomeTreadingState extends State<WalletHomeTreading>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    final double horizontalPadding = w * 0.05;
    return Container(
      padding: EdgeInsets.all(horizontalPadding),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(140),
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
          ...List<Widget>.generate(widget.coinList.length, (index) {
            final Animation<double> animation = CurvedAnimation(
              parent: controller,
              curve: Interval(
                (1 / widget.coinList.length) * index,
                (1 / widget.coinList.length) * (index + 1),
              ),
            );
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                final double dx = Tween<double>(
                  begin: 50,
                  end: 0,
                ).evaluate(animation);
                return Transform.translate(
                  offset: Offset(dx, 0),
                  child: Opacity(opacity: animation.value, child: child),
                );
              },
              child: TreadingItem(coin: widget.coinList[index]),
            );
          }),
          SizedBox(height: h * 0.1),
        ],
      ),
    );
  }
}

class TreadingItem extends StatelessWidget {
  final Coin coin;
  const TreadingItem({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.02),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(right: w * 0.04),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: WalletColor.moneyIconColor[coin.icon],
            ),
            child: SvgPicture.asset(coin.icon),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coin.name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  coin.symble,
                  style: TextStyle(
                    fontSize: TextTheme.of(context).bodySmall?.fontSize,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(coin.price, style: TextStyle(fontWeight: FontWeight.bold)),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        coin.changePercent > 0
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: coin.changePercent > 0
                            ? Color(0xff5FC88F)
                            : Color(0xffFF6464),
                      ),
                    ),
                    TextSpan(
                      text: "${coin.changePercent.abs()}%",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
