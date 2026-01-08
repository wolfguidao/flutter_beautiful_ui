import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:e_robo_wallet/entity/coin.dart';
import 'package:e_robo_wallet/entity/coin_history.dart';
import 'package:e_robo_wallet/entity/coin_news.dart';
import 'package:e_robo_wallet/entity/coin_price_alerts.dart';
import 'package:e_robo_wallet/entity/news.dart';
import 'package:e_robo_wallet/entity/price_alerts.dart';
import 'package:e_robo_wallet/gen/assets.gen.dart';

final Coin bitcoin = Coin(
  name: "Bitcoin",
  symble: "BTC",
  icon: Assets.images.walletBitcoin,
  price: "\$32,129.80",
  changePercent: 2.5,
  mCap: "MCap \$893.43 Bn",
  capitalization: '\$231,233',
  suply: 114.211,
  chartSpot: {
    "24H": List.generate(12, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 14 + 1);
    }),
    "1W": List.generate(14, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 19 + 1);
    }),
    "1Y": List.generate(12, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 45 + 5);
    }),
    "ALL": List.generate(20, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 100);
    }),
    "Point": List.generate(15, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 100);
    }),
  },
);

final Coin neo = Coin(
  name: "Neo",
  symble: "NEO",
  icon: Assets.images.walletNeo,
  price: "\$13,221.55",
  changePercent: 2.5,
  mCap: "MCap \$893.43 Bn",
  capitalization: '\$231,233',
  suply: 114.211,
  chartSpot: {
    "24H": List.generate(12, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 14 + 1);
    }),
    "1W": List.generate(14, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 19 + 1);
    }),
    "1Y": List.generate(12, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 45 + 5);
    }),
    "ALL": List.generate(20, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 100);
    }),
    "Point": List.generate(15, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 100);
    }),
  },
);

final Coin achain = Coin(
  name: "Achain",
  symble: "ACT",
  icon: Assets.images.walletAchain,
  price: "\$28,312.22",
  changePercent: -2.5,
  mCap: "MCap \$893.43 Bn",
  capitalization: '\$231,233',
  suply: 114.211,
  chartSpot: {
    "24H": List.generate(12, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 14 + 1);
    }),
    "1W": List.generate(14, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 19 + 1);
    }),
    "1Y": List.generate(12, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 45 + 5);
    }),
    "ALL": List.generate(20, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 100);
    }),
    "Point": List.generate(15, (index) {
      return FlSpot(index.toDouble(), Random().nextDouble() * 100);
    }),
  },
);

final CoinPriceAlerts bitcoinAlerts = CoinPriceAlerts(
  coin: bitcoin,
  priceAlerts: [
    PriceAlerts(time: "3 mins ago", amount: 110000.00),
    PriceAlerts(time: "1 hour ago", amount: -4350.00),
    PriceAlerts(time: "9 hour ago", amount: -2139.00),
  ],
);

final CoinPriceAlerts neoAlerts = CoinPriceAlerts(
  coin: neo,
  priceAlerts: [
    PriceAlerts(time: "3 mins ago", amount: 110000.00),
    PriceAlerts(time: "1 hour ago", amount: -4350.00),
    PriceAlerts(time: "9 hour ago", amount: -2139.00),
  ],
);

final CoinPriceAlerts achainAlerts = CoinPriceAlerts(
  coin: achain,
  priceAlerts: [
    PriceAlerts(time: "3 mins ago", amount: 110000.00),
    PriceAlerts(time: "1 hour ago", amount: -4350.00),
    PriceAlerts(time: "9 hour ago", amount: -2139.00),
  ],
);

final CoinHistory bitcoinHistory = CoinHistory(
  coin: bitcoin,
  amount: 0.0056,
  time: "11:31 AM",
);

final CoinHistory neoHistory = CoinHistory(
  coin: neo,
  amount: 1.3000,
  time: "11:31 AM",
);

final CoinHistory achainHistory = CoinHistory(
  coin: achain,
  amount: 3.2056,
  time: "11:31 AM",
);

final CoinNews neoNews = CoinNews(
  coin: neo,
  news: [
    News(
      image: Assets.images.walletInsightsRobot.path,
      title: "Participate in the Corra Finance Airdrop on CoinMarketCap",
      time: "3 days ago",
    ),
  ],
);

final CoinNews bitcoinNews = CoinNews(
  coin: bitcoin,
  news: [
    News(
      image: Assets.images.walletNewsImage.path,
      title: "Participate in the Corra Finance Airdrop on CoinMarketCap",
      time: "3 days ago",
    ),
    News(
      image: Assets.images.walletNewsImage.path,
      title: "Participate in the Corra Finance Airdrop on CoinMarketCap",
      time: "1 days ago",
    ),
  ],
);

final CoinNews achainNews = CoinNews(
  coin: achain,
  news: [
    News(
      image: Assets.images.walletNewsImage.path,
      title: "Participate in the Corra Finance Airdrop on CoinMarketCap",
      time: "3 days ago",
    ),
    News(
      image: Assets.images.walletNewsImage.path,
      title: "Participate in the Corra Finance Airdrop on CoinMarketCap",
      time: "1 days ago",
    ),
  ],
);
