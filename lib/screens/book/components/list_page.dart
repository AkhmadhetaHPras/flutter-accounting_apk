import 'package:accounting_apk/constants.dart';
import 'package:accounting_apk/models/item.dart';
import 'package:accounting_apk/screens/book/components/list_item.dart';
import 'package:accounting_apk/screens/book/components/text_table_title.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  child:
                      TextTableTitle(text: "Cash In", align: TextAlign.center),
                ),
                Expanded(
                  flex: 1,
                  child:
                      TextTableTitle(text: "Cash Out", align: TextAlign.center),
                ),
              ],
            ),
          ),

          // Listview
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              // height: MediaQuery.of(context).size.height - 340,
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListItem(
                    name: "Name",
                    date: DateTime.now(),
                    cashIn: 12000,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
