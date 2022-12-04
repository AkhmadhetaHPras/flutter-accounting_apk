import 'package:accounting_apk/constants.dart';
import 'package:accounting_apk/screens/book/components/cash_in_form.dart';
import 'package:accounting_apk/size_config.dart';
import "package:flutter/material.dart";

class CashIn extends StatefulWidget {
  static String routeName = "/cashin";

  const CashIn({super.key});

  @override
  State<CashIn> createState() => _CashInState();
}

class _CashInState extends State<CashIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cash In"),
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
                  Text("New Cash In Form", style: headingStyleGreen),
                  const Text(
                    "Complete this form\nto add new cash in data",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  const CashInForm(),
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
