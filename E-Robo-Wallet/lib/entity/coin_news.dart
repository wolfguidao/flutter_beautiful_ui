// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_robo_wallet/entity/coin.dart';
import 'package:e_robo_wallet/entity/news.dart';

class CoinNews {
  Coin coin;
  List<News> news;
  CoinNews({required this.coin, required this.news});
}
