import 'package:accounting_apk/constants.dart';
import 'package:accounting_apk/screens/book/components/icon_btn_pdf.dart';
import 'package:accounting_apk/size_config.dart';
import 'package:flutter/material.dart';

class BookHeader extends StatelessWidget {
  const BookHeader({
    Key? key,
  }) : super(key: key);

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
            onTap: () {},
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.save_alt,
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
