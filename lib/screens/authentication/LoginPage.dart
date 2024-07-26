import 'package:flutter/material.dart';

import '../../routes/AppRoutes.dart';
import '../../utils/AppCustom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCustom.colorWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppCustom.colorOrange,
        title: Text(
          'Entrar',
          style: TextStyle(
            color: AppCustom.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppCustom.SB10,
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Login.png'),
                ),
              ),
            ),
            AppCustom.SB30,
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              ),
            ),
            AppCustom.SB10,
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outlined),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              ),
              obscureText: true,
            ),
            AppCustom.SB10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signUpPage);
                  },
                  child: Text(
                    'Não tem uma conta? Clique aqui! :)',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppCustom.colorBlue,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.forgotPasswordPage);
                  },
                  child: Text(
                    'Esqueceu minha senha',
                    style: TextStyle(
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
                var email = emailController.text;
                var password = passwordController.text;

                print('${email} ${password}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppCustom.colorOrange,
                foregroundColor: AppCustom.colorWhite,
              ),
              icon: Icon(Icons.login),
              label: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
