import 'package:accounting_apk/constants.dart';
import 'package:accounting_apk/screens/book/components/text_table_title.dart';
import 'package:flutter/material.dart';

class SummaryBook extends StatelessWidget {
  const SummaryBook({
    Key? key,
    required this.balance,
    required this.totalCashIn,
    required this.totalCashOut,
  }) : super(key: key);

  final int balance;
  final int totalCashIn;
  final int totalCashOut;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor2,
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextTableTitle(text: "Total Cash In"),
                Text(
                  totalCashIn.toString(),
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextTableTitle(text: "Total Cash Out"),
                Text(
                  totalCashOut.toString(),
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextTableTitle(text: "Balance"),
                Text(
                  balance.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
