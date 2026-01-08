import 'package:flutter/material.dart';
import 'package:e_robo_wallet/entity/coin.dart';
import 'package:e_robo_wallet/entity/coin_news.dart';
import 'package:e_robo_wallet/entity/news.dart';
import 'package:e_robo_wallet/constant/wallet_color.dart';
import 'package:flutter_svg/svg.dart';

class WalletNewsList extends StatefulWidget {
  final CoinNews coinNews;
  const WalletNewsList({super.key, required this.coinNews});

  @override
  State<WalletNewsList> createState() => _WalletNewsListState();
}

class _WalletNewsListState extends State<WalletNewsList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _typeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _typeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(0, 0.2),
    );
    Future.delayed(Duration(seconds: 1), () {
      _controller.forward();
    });
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
    return SliverList(
      delegate: SliverChildListDelegate([
        AnimatedBuilder(
          animation: _typeAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 20.0 * (1 - _typeAnimation.value)),
              child: Opacity(opacity: _typeAnimation.value, child: child),
            );
          },
          child: NewsType(coin: widget.coinNews.coin),
        ),
        ...List.generate(widget.coinNews.news.length, (index) {
          final Animation animation = CurvedAnimation(
            parent: _controller,
            curve: Interval(0.2 + 0.8 / 5 * index, 0.2 + 0.8 / 5 * (index + 1)),
          );
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, 20.0 * (1 - animation.value)),
                child: Opacity(opacity: animation.value, child: child),
              );
            },
            child: NewsItem(news: widget.coinNews.news[index]),
          );
        }),
      ]),
    );
  }
}

class NewsType extends StatelessWidget {
  final Coin coin;
  const NewsType({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: WalletColor.moneyIconColor[coin.icon],
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(coin.icon),
      ),
      title: Text(
        "${coin.name} news",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      trailing: TextButton(
        onPressed: () {},
        child: Text("See All", style: TextStyle(color: Color(0xff767DFF))),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.sizeOf(context).height;
    final double w = MediaQuery.sizeOf(context).width;
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
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
              child: Image.asset(width: w, news.image, fit: BoxFit.fitWidth),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(news.title, style: TextStyle(fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Color(0xff9395A4)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        news.time,
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
        ],
      ),
    );
  }
}
