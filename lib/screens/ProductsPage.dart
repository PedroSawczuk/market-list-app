import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_list_app/utils/DrawerCustom.dart';

import '../utils/AppCustom.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppCustom.colorOrange,
        iconTheme: IconThemeData(
            color: AppCustom.colorWhite), // Adicionar cor ao ícone do Drawer
        title: Text(
          'Produtos comprados',
          style: TextStyle(
            color: AppCustom.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: DrawerCustom(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Product')
            .where('completed', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          final products = snapshot.data!.docs;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final productData = product.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(productData['productName']),
                subtitle: Text(productData['productQuant'].toString()),
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
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('Product')
                            .doc(product.id)
                            .update(
                          {
                            'completed': false,
                          },
                        );
                      },
                      icon: Icon(Icons.close),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
