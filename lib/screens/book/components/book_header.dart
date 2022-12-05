import 'package:accounting_apk/api/pdf.dart';
import 'package:accounting_apk/api/pdf_api.dart';
import 'package:accounting_apk/constants.dart';
import 'package:accounting_apk/models/item.dart';
import 'package:accounting_apk/size_config.dart';
import 'package:flutter/material.dart';

class BookHeader extends StatefulWidget {
  const BookHeader({
    Key? key,
    required this.items,
    required this.time,
    required this.cIn,
    required this.cOut,
    required this.balance,
  }) : super(key: key);

  final List<Item> items;
  final String time;
  final int cIn;
  final int cOut;
  final int balance;

  @override
  State<BookHeader> createState() => _BookHeaderState();
}

class _BookHeaderState extends State<BookHeader> {
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Accounting Book",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: kPrimaryLightColor),
          ),
          InkWell(
            onTap: () async {
              // here
              setState(() {
                _isloading = true;
              });
              final pdfFile = await Pdf.generate(widget.items, widget.time,
                  widget.cIn, widget.cOut, widget.balance);

              setState(() {
                _isloading = false;
              });

              PdfApi.openFile(pdfFile);
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: !_isloading
                      ? const Icon(
                          Icons.save_alt,
                          color: Colors.white,
                        )
                      : const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
