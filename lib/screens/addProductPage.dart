import 'package:flutter/material.dart';
import 'package:market_list_app/db/FirebaseDatabase.dart';
import 'package:market_list_app/utils/AppCustom.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => AddProductPageState();
}

class AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productQuantController = TextEditingController();
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppCustom.colorOrange,
        title: Text(
          'Adicionar Produto',
          style: TextStyle(
            color: AppCustom.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            AppCustom.SB30,
            TextFormField(
              controller: _productNameController,
              decoration: InputDecoration(
                labelText: 'Nome do Produto',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              ),
            ),
            AppCustom.SB20,
            TextFormField(
              controller: _productQuantController,
              decoration: InputDecoration(
                labelText: 'Quantidades de Produto',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  if (int.tryParse(value) == null) {
                    return 'Por favor, insira um número válido';
                  }
                }
                return null;
              },
            ),
            AppCustom.SB10,
            ElevatedButton(
              onPressed: () {
                _addProduct();
              },
              child: Text('Adicionar Produto'),
              style: ElevatedButton.styleFrom(
                foregroundColor: AppCustom.colorWhite,
                backgroundColor: AppCustom.colorOrange,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addProduct() {
    if (_formKey.currentState!.validate()) {
      String productName = _productNameController.text;
      int productQuant = 1; // Quantidade padrão

      // Se o campo de quantidade não estiver vazio, use o valor inserido
      if (_productQuantController.text.isNotEmpty) {
        productQuant = int.parse(_productQuantController.text);
      }

      bool completed = false;
      _firebaseDatabase.addProduct(
        context: context,
        productName: productName,
        productQuant: productQuant,
        completed: completed,
      );
      // Limpar os campos após a adição do produto
      _productNameController.clear();
      _productQuantController.clear();
    }
  }
}
