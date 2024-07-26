import 'package:flutter/material.dart';
import 'package:market_list_app/db/FirebaseDatabase.dart';
import 'package:market_list_app/routes/AppRoutes.dart';
import 'package:market_list_app/utils/AppCustom.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCustom.colorWhite,
      appBar: AppBar(
        backgroundColor: AppCustom.colorOrange,
        automaticallyImplyLeading: false,
        title: Text(
          'Cadastrar-se',
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
                    image: AssetImage('assets/images/Sign_up.png'),
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
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outlined),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma senha';
                  }
                  return null;
                },
              ),
              AppCustom.SB10,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.loginPage);
                    },
                    child: Text(
                      'Já tem uma conta? Clique aqui! :)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppCustom.colorBlue,
                      ),
                    ),
                  ),
                ],
              ),
              AppCustom.SB20,
              ElevatedButton.icon(
                onPressed: () {
                  _signupFunction();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppCustom.colorOrange,
                  foregroundColor: AppCustom.colorWhite,
                  minimumSize: Size(20, 50),
                ),
                icon: Icon(Icons.person_add_alt_1_outlined),
                label: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signupFunction() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      _firebaseDatabase.createNewUser(
        context: context,
        email: email,
        password: password,
      );
    }
  }
}
