import 'package:accounting_apk/constants.dart';
import 'package:accounting_apk/screens/book/components/cash_out_form.dart';
import 'package:accounting_apk/size_config.dart';
import "package:flutter/material.dart";

class CashOut extends StatefulWidget {
  static String routeName = "/cashout";

  const CashOut({super.key});

  @override
  State<CashOut> createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cash Out"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                  Text("New Cash Out Form", style: headingStyleRed),
                  const Text(
                    "Complete this form\nto add new cash out data",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  const CashOutForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text(
                    'By submit this form, you will add this data to the accounting book',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
