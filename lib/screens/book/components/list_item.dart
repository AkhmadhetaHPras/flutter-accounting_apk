import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.name,
    required this.date,
    this.cashIn,
    this.cashOut,
  }) : super(key: key);

  final String name;
  final String date;
  final int? cashIn;
  final int? cashOut;

  static String convertToIdr(dynamic number) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 0,
    );
    return currencyFormatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Container clicked");
        // Navigator.pushNamed(context, CashEdit.routeName);
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom:
                BorderSide(color: Color.fromARGB(255, 220, 220, 220), width: 3),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    date,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                cashIn != null ? convertToIdr(cashIn) : "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                cashOut != null ? convertToIdr(cashOut) : "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
