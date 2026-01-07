import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/constant/wallet_color.dart';
import 'package:flutter_svg/svg.dart';

class WalletMarketSearch extends StatelessWidget {
  final Map<String, String> marketType;
  const WalletMarketSearch({super.key, required this.marketType});

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: h * 0.01),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.search_rounded),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: marketType.keys.map((type) {
            return MarketTypeItem(
              typeIcon: type,
              typeText: marketType[type] ?? "",
            );
          }).toList(),
        ),
      ],
    );
  }
}

class MarketTypeItem extends StatelessWidget {
  final String typeIcon;
  final String typeText;
  const MarketTypeItem({
    super.key,
    required this.typeIcon,
    required this.typeText,
  });

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    return Container(
      width: w * 0.28,
      height: w * 0.28,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: WalletColor.marketTypeColor[typeIcon],
              child: SvgPicture.asset(typeIcon, width: w * 0.05),
            ),
            Text(typeText, style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
