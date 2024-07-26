import 'package:flutter/material.dart';
import '../../db/FirebaseDatabase.dart';
import '../../utils/AppCustom.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCustom.colorWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppCustom.colorOrange,
        title: Text(
          'Esqueci minha senha',
          style: TextStyle(
            color: AppCustom.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppCustom.SB10,
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Forgot_password.png'),
                  ),
                ),
              ),
              AppCustom.SB30,
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um e-mail';
                  }
                  return null;
                },
              ),
              AppCustom.SB10,
              AppCustom.SB20,
              ElevatedButton.icon(
                onPressed: () {
                  _resetPassword();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppCustom.colorOrange,
                  foregroundColor: AppCustom.colorWhite,
                ),
                icon: Icon(Icons.mark_email_unread_outlined),
                label: Text('Recuperar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      _firebaseDatabase.resetPassword(
        context: context,
        email: email,
      );
    }
  }
}
