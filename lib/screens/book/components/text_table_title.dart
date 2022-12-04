import 'package:flutter/material.dart';

class TextTableTitle extends StatelessWidget {
  const TextTableTitle({
    Key? key,
    required this.text,
    this.align = TextAlign.start,
  }) : super(key: key);

  final String text;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
    );
  }
}
