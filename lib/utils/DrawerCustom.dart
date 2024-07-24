import 'package:flutter/material.dart';
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
              // Add Function
            },
            title: Text('Página Inicial'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            onTap: () {
              // Add Function
            },
            title: Text('Meu Perfil'),
          ),
          ListTile(
            leading: Icon(Icons.developer_mode),
            onTap: () {
              // Add Function
            },
            title: Text('Desenvolvedor'),
          ),

          // Adicionar após fazer a autenticação
          // ListTile(
          //   leading: Icon(Icons.logout),
          //   onTap: () {
          //     // Add Function
          //   },
          //   title: Text('Sair'),
          // ),
        ],
      ),
    );
  }
}
