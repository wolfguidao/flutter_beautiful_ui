import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';

class WalletColor {
  static final Map<String, Color> moneyIconColor = {
    Assets.images.walletBitcoin: Color(0xffFFE4C3),
    Assets.images.walletNeo: Color(0xffD5EEC9),
    Assets.images.walletAchain: Color(0xffE0E2FF),
  };

  static final Map<String, Color> marketTypeColor = {
    Assets.images.walletWahchlists: Color(0xffDEF5E9),
    Assets.images.walletTrending: Color(0xffDFF0FF),
    Assets.images.walleBest: Color(0xffFFEBE4),
  };
}
