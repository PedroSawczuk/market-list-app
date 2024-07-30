import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_list_app/utils/DrawerCustom.dart';
import '../routes/AppRoutes.dart';
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
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       AppCustom.SB20,
      //       Center(
      //         child: Text(
      //           'Lista de Produtos',
      //           style: TextStyle(
      //             fontSize: 25,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Product')
            .where('completed', isEqualTo: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Nenhum produto encontrado'));
          }

          final products = snapshot.data!.docs;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final productData = product.data() as Map<String, dynamic>;

              return Column(
                children: [
                  ListTile(
                    title: Text(
                      'Nome do produto: ${productData['productName']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      'Quantidade: ${productData['productQuant'].toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('Product')
                                .doc(product.id)
                                .delete();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Produto excluido!')),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.check_box),
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('Product')
                                .doc(product.id)
                                .update(
                              {
                                'completed': true,
                              },
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Produto comprado!')),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppCustom.colorOrange,
        tooltip: 'Adicionar',
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addProductPage);
        },
        child: Icon(
          Icons.add_shopping_cart_outlined,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
