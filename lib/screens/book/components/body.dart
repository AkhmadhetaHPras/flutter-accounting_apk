import 'package:accounting_apk/components/loader.dart';
import 'package:accounting_apk/constants.dart';
import 'package:accounting_apk/models/item.dart';
import 'package:accounting_apk/screens/book/cash_in.dart';
import 'package:accounting_apk/screens/book/components/book_header.dart';
import 'package:accounting_apk/screens/book/components/icon_btn_pdf.dart';
import 'package:accounting_apk/screens/book/components/list_page.dart';
import 'package:accounting_apk/screens/book/components/summary.dart';
import 'package:accounting_apk/services/database_services.dart';
import 'package:accounting_apk/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Item> items = [];
  bool _isLoading = false;
  String month = DateTime.now().month.toString();
  String year = DateTime.now().year.toString();
  int cashIn = 0;
  int cashOut = 0;
  int balance = 0;

  @override
  void initState() {
    super.initState();
    getAll();
  }

  String getMonthName() {
    return DateFormat('MMMM').format(DateTime(0, int.parse(month)));
  }

  void updateSummary() {
    var cIn = 0;
    var cOut = 0;
    for (var element in items) {
      if (element.cashIn != null) {
        cIn += element.cashIn!;
      }
      if (element.cashOut != null) {
        cOut += element.cashOut!;
      }
    }
    setState(() {
      cashIn = cIn;
      cashOut = cOut;
      balance = cashIn - cashOut;
    });
  }

  void getAll() async {
    setState(() {
      _isLoading = true;
    });
    var response = await DatabaseService().itemList(month, year);
    items = response;
    updateSummary();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // header
          Container(
            color: kPrimaryColor,
            height: 60,
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                const BookHeader(),
                SizedBox(height: getProportionateScreenWidth(10)),
              ],
            ),
          ),

          SizedBox(height: getProportionateScreenWidth(10)),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // nav month
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBtn(
                      icon: Icons.arrow_back_ios_rounded,
                      tap: () {
                        var date =
                            DateTime(int.parse(year), int.parse(month) - 1, 1);
                        setState(() {
                          month = date.month.toString();
                          year = date.year.toString();
                        });
                        getAll();
                      },
                    ),
                    Text(
                      "${getMonthName()} $year",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    IconBtn(
                      icon: Icons.arrow_forward_ios_rounded,
                      tap: () {
                        var date =
                            DateTime(int.parse(year), int.parse(month) + 1, 1);
                        setState(() {
                          month = date.month.toString();
                          year = date.year.toString();
                        });
                        getAll();
                      },
                    ),
                  ],
                ),

                // ACTION BTN
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CashIn.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text("Cash In"),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("Cash Out"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(10)),

          !_isLoading
              ? ListPage(
                  items: items,
                )
              : const Loader(),

          // summary
          SummaryBook(
            balance: balance,
            totalCashIn: cashIn,
            totalCashOut: cashOut,
          ),
        ],
      ),
    );
  }
}
