import 'package:flutter/material.dart';
import '../screens/HomePage.dart';

class AppRoutes {
  static const homePage = 'homePage';

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (BuildContext context) => HomePage(),
    };
  }
}
