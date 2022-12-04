import 'package:accounting_apk/constants.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: const Center(
          child: CircularProgressIndicator(
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
