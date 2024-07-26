import 'package:flutter/material.dart';
import '../screens/HomePage.dart';
import '../screens/authentication/SignUpPage.dart';
import '../screens/authentication/LoginPage.dart';
import '../screens/authentication/ForgotPasswordPage.dart';
import '../screens/developerPage.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const signUpPage = '/signUpPage';
  static const loginPage = '/loginPage';
  static const forgotPasswordPage = '/forgotPasswordPage';
  static const developerPage = '/developerPage';

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (BuildContext context) => HomePage(),
      signUpPage: (BuildContext context) => SignUpPage(),
      loginPage: (BuildContext context) => LoginPage(),
      forgotPasswordPage: (BuildContext context) => ForgotPasswordPage(),
      developerPage: (BuildContext context) => DeveloperPage(),
    };
  }
}
