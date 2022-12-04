import 'package:flutter/material.dart';

import 'components/body.dart';

class BookScreen extends StatelessWidget {
  static String routeName = "/book";

  const BookScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
