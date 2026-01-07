// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_beautiful_ui/entity/coin.dart';
import 'package:flutter_beautiful_ui/entity/price_alerts.dart';

class CoinPriceAlerts {
  Coin coin;
  List<PriceAlerts> priceAlerts;
  CoinPriceAlerts({
    required this.coin,
    required this.priceAlerts,
  });

}
