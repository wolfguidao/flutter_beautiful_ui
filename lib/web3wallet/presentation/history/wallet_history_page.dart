import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/history/widget/wallet_history_list.dart';

class WalletHistoryPage extends StatefulWidget {
  const WalletHistoryPage({super.key});

  @override
  State<WalletHistoryPage> createState() => _WalletHistoryPageState();
}

class _WalletHistoryPageState extends State<WalletHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.sizeOf(context).height;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: false,
          toolbarHeight: h * 0.1,
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Wallet Value",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: TextTheme.of(context).titleLarge?.fontSize,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01),
                child: Text(
                  "\$29,100.50",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        WalletHistoryList(),
      ],
    );
  }
}
