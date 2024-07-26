import 'package:flutter/material.dart';
import 'package:market_list_app/utils/DrawerCustom.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../utils/AppCustom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppCustom.colorOrange,
        iconTheme: IconThemeData(
            color: AppCustom.colorWhite), // Adicionar cor ao ícone do Drawer
        title: Text(
          'Página Inicial',
          style: TextStyle(
            color: AppCustom.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: DrawerCustom(),
      body: SingleChildScrollView(
        child: Text('OI'),
      ),
    );
  }
}
