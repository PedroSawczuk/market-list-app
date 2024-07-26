import 'package:flutter/material.dart';
import 'package:market_list_app/routes/AppRoutes.dart';
import 'package:market_list_app/utils/AppCustom.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCustom.colorWhite,
      appBar: AppBar(
        backgroundColor: AppCustom.colorOrange,
        automaticallyImplyLeading: false, // Remove a setinha de voltar
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
                var email = emailController.text;
                var password = passwordController.text;

                print('${email} ${password}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppCustom.colorOrange,
                foregroundColor: AppCustom.colorWhite,
              ),
              icon: Icon(Icons.person_add_alt_1_outlined),
              label: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
