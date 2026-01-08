// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_robo_wallet/entity/coin.dart';

class CoinHistory {
  Coin coin;
  double amount;
  String time;
  CoinHistory({
    required this.coin,
    required this.amount,
    required this.time,
  });

}
