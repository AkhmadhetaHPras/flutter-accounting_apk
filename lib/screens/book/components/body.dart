import 'package:accounting_apk/constants.dart';
import 'package:accounting_apk/screens/book/cash_in.dart';
import 'package:accounting_apk/screens/book/components/book_header.dart';
import 'package:accounting_apk/screens/book/components/icon_btn_pdf.dart';
import 'package:accounting_apk/screens/book/components/list_item.dart';
import 'package:accounting_apk/screens/book/components/summary.dart';
import 'package:accounting_apk/screens/book/components/text_table_title.dart';
import 'package:accounting_apk/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

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
                  children: const [
                    IconBtn(icon: Icons.arrow_back_ios_rounded),
                    Text(
                      "Januari 2022",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    IconBtn(icon: Icons.arrow_forward_ios_rounded),
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
          Expanded(
            child: Column(
              children: [
                // list view header
                Container(
                  height: 35,
                  color: kPrimaryColor2,
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: TextTableTitle(text: "Date"),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextTableTitle(
                            text: "Cash In", align: TextAlign.center),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextTableTitle(
                            text: "Cash Out", align: TextAlign.center),
                      ),
                    ],
                  ),
                ),

                // Listview
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    // height: MediaQuery.of(context).size.height - 340,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashIn: 12000,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashOut: 1892000,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashIn: 12000,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashIn: 12000,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashIn: 138900,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashIn: 12000,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashIn: 1387600,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashOut: 1289000,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashOut: 1289000,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashOut: 1289000,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashOut: 1289000,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashOut: 1289000,
                          ),
                          ListItem(
                            name: "Name",
                            date: DateTime.now(),
                            cashOut: 1289000,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // summary
          const SummaryBook(
            balance: 12000,
            totalCashIn: 12000,
            totalCashOut: 38999,
          ),
        ],
      ),
    );
  }
}
