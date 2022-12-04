import 'package:accounting_apk/screens/book/book_screen.dart';
import 'package:accounting_apk/screens/book/cash_in.dart';
import 'package:accounting_apk/screens/book/cash_out.dart';
import 'package:accounting_apk/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  BookScreen.routeName: (context) => const BookScreen(),
  CashIn.routeName: (context) => const CashIn(),
  CashOut.routeName: (context) => const CashOut(),
};
