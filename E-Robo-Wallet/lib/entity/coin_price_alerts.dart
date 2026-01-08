// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_robo_wallet/entity/coin.dart';
import 'package:e_robo_wallet/entity/price_alerts.dart';

class CoinPriceAlerts {
  Coin coin;
  List<PriceAlerts> priceAlerts;
  CoinPriceAlerts({
    required this.coin,
    required this.priceAlerts,
  });

}
