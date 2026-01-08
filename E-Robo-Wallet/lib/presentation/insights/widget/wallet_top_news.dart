import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/entity/coin_news.dart';
import 'package:flutter_beautiful_ui/constant/wallet_color.dart';
import 'package:flutter_svg/svg.dart';

class WalletTopNews extends StatefulWidget {
  final CoinNews coinNews;
  const WalletTopNews({super.key, required this.coinNews});

  @override
  State<WalletTopNews> createState() => _WalletTopNewsState();
}

class _WalletTopNewsState extends State<WalletTopNews>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    return SliverToBoxAdapter(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, 20.0 * (1 - _animation.value)),
            child: Opacity(opacity: _animation.value, child: child),
          );
        },
        child: Column(
          children: [
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: WalletColor.moneyIconColor[widget.coinNews.coin.icon],
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(widget.coinNews.coin.icon),
              ),
              title: Text(
                "${widget.coinNews.coin.name} news",
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Image.asset(
                width: w,
                widget.coinNews.news.first.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: horizontalPadding,
              ),
              child: Text(
                widget.coinNews.news.first.title,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: horizontalPadding,
              ),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: Color(0xff9395A4)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.coinNews.news.first.time,
                      style: TextStyle(
                        fontSize: TextTheme.of(context).bodySmall?.fontSize,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9395A4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
