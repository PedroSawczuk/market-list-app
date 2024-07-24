import 'package:flutter/material.dart';

import 'routes/AppRoutes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.homePage,
    routes: AppRoutes.define(),
  ));
}