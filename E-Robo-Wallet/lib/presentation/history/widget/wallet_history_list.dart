import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/constant/wallet_data.dart';
import 'package:flutter_beautiful_ui/entity/coin_history.dart';
import 'package:flutter_beautiful_ui/constant/wallet_color.dart';
import 'package:flutter_svg/svg.dart';

class WalletHistoryList extends StatefulWidget {
  const WalletHistoryList({super.key});

  @override
  State<WalletHistoryList> createState() => _WalletHistoryListState();
}

class _WalletHistoryListState extends State<WalletHistoryList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<CoinHistory> _coinHistory = [
    bitcoinHistory,
    neoHistory,
    achainHistory,
  ];
  bool _isHostory = true;

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
    final double h = MediaQuery.sizeOf(context).height;
    final double w = MediaQuery.sizeOf(context).width;
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
          width: w,
          height: h * 0.065,
          decoration: BoxDecoration(
            color: Color(0xffEBEFF1),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  top: 5,
                  bottom: 5,
                  left: _isHostory
                      ? horizontalPadding + (w - horizontalPadding * 2 - 10) / 2
                      : 10,
                  child: Container(
                    width: w / 2.5,
                    height: h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isHostory = false;
                        });
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 500),
                        style: TextStyle(
                          color: !_isHostory ? Colors.black : Color(0xff9395A5),
                          fontWeight: FontWeight.bold,
                        ),
                        child: Text("Porfolio"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isHostory = true;
                        });
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 500),
                        style: TextStyle(
                          color: _isHostory ? Colors.black : Color(0xff9395A5),
                          fontWeight: FontWeight.bold,
                        ),
                        child: Text("History"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ...List<Widget>.generate(_coinHistory.length + 1, (index) {
          final Animation animation = CurvedAnimation(
            parent: _controller,
            curve: Interval(
              1 / (_coinHistory.length + 1) * index,
              1 / (_coinHistory.length + 1) * (index + 1),
            ),
          );
          late Widget sliverWidget;
          if (index == 0) {
            sliverWidget = Padding(
              padding: EdgeInsets.symmetric(
                vertical: h * 0.01,
                horizontal: horizontalPadding,
              ),
              child: Text(
                "12 June 2021",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff9395A4),
                ),
              ),
            );
          } else {
            sliverWidget = Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: w * 0.04),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: WalletColor
                          .moneyIconColor[_coinHistory[index - 1].coin.icon],
                    ),
                    child: SvgPicture.asset(_coinHistory[index - 1].coin.icon),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _coinHistory[index - 1].coin.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _coinHistory[index - 1].time,
                          style: TextStyle(
                            color: Color(0xff9395A4),
                            fontSize: TextTheme.of(context).bodySmall?.fontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${_coinHistory[index - 1].coin.symble} ${_coinHistory[index - 1].amount}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, 20.0 * (1 - animation.value)),
                child: Opacity(opacity: animation.value, child: child),
              );
            },
            child: sliverWidget,
          );
        }),
      ]),
    );
  }
}
