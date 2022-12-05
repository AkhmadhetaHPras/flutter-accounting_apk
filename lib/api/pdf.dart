import 'dart:io';
import 'package:accounting_apk/api/pdf_api.dart';
import 'package:accounting_apk/models/item.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class Pdf {
  static Future<File> generate(
    List<Item> items,
    String time,
    int cIn,
    int cOut,
    int balance,
  ) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildTitle(time),
        buildTable(items),
        Divider(),
        buildTotal(cIn, cOut, balance),
      ],
      footer: (context) => buildFooter(),
    ));

    return PdfApi.saveDocument(name: "$time.pdf", pdf: pdf);
  }

  static Widget buildTitle(String time) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Catatan Kas $time',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildTable(List<Item> list) {
    final headers = [
      'Label',
      'Date',
      'Cash In',
      'Cash Out',
    ];

    final data = list.map((item) {
      return [
        item.label,
        "${item.date} ${item.time}",
        item.cashIn != null ? convertToIdr(item.cashIn) : "",
        item.cashOut != null ? convertToIdr(item.cashOut) : "",
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: const BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
      },
    );
  }

  static Widget buildTotal(int cIn, int cOut, int balannce) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Cash In total',
                  value: convertToIdr(cIn),
                  unite: true,
                ),
                buildText(
                  title: 'Cash Out Total',
                  value: convertToIdr(cOut),
                  unite: true,
                ),
                Divider(),
                buildText(
                  title: 'Total Saldo',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: convertToIdr(balannce),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          Text(
            "Copyright Catatan Kas",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(
            "2022",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      );

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }

  static String convertToIdr(dynamic number) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(number);
  }
}
