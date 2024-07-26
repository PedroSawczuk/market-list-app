import 'package:flutter/material.dart';
import 'package:market_list_app/utils/DrawerCustom.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/AppCustom.dart';

class DeveloperPage extends StatefulWidget {
  const DeveloperPage({super.key});

  @override
  State<DeveloperPage> createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppCustom.colorOrange,
        iconTheme: IconThemeData(
            color: AppCustom.colorWhite), // Adicionar cor ao ícone do Drawer
        title: Text(
          'Desenvolvedor',
          style: TextStyle(
            color: AppCustom.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: DrawerCustom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppCustom.SB10,
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/pedro-sawczuk.jpg'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.5),
              child: Text(
                'Pedro Sawczuk',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ),
            Text('Estudande de Análise e Desenvolvimento de Sistemas'),
            Text('pelo Instituto Federal de Rondônia'),
            AppCustom.SB30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppCustom.colorOrange,
                    foregroundColor: AppCustom.colorWhite,
                  ),
                  onPressed: () {
                    _linkGitURL();
                  },
                  child: Text('Repositório no GitHub'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppCustom.colorOrange,
                    foregroundColor: AppCustom.colorWhite,
                  ),
                  onPressed: () {
                    _linkInstaURL();
                  },
                  child: Text('Instagram'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _linkGitURL() async {
    final Uri url =
        Uri.parse('https://github.com/PedroSawczuk/market-list-app');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  void _linkInstaURL() async {
    final Uri url = Uri.parse('https://www.instagram.com/pedrosawczuk');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
