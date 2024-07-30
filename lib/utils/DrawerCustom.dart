import 'package:flutter/material.dart';
import 'package:market_list_app/routes/AppRoutes.dart';
import '../utils/AppCustom.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppCustom.colorOrange,
            ),
            child: Text(
              'Market List',
              style: TextStyle(
                color: AppCustom.colorWhite,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.homePage);
            },
            title: Text('Página Inicial'),
          ),
          ListTile(
            leading: Icon(Icons.developer_mode),
            onTap: () {
              print('Entrnado na página de Desenvolvedor');
              Navigator.pushNamed(context, AppRoutes.developerPage);
            },
            title: Text('Desenvolvedor'),
          ),

          ListTile(
            leading: Icon(Icons.shop_two),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.productsPage);
            },
            title: Text('Produtos Comprados'),
          ),
        ],
      ),
    );
  }
}
