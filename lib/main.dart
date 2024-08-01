import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market_list_app/db/locallyDatabase.dart';
import 'firebase_options.dart';
import 'routes/AppRoutes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  LocalUser? user = await getUserFromLocal();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: user != null ? AppRoutes.homePage : AppRoutes.loginPage,
      routes: AppRoutes.define(),
    ),
  );
}
