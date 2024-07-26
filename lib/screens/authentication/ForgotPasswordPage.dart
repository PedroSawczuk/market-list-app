import 'package:flutter/material.dart';
import '../../utils/AppCustom.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

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
            AppCustom.SB20,
            ElevatedButton.icon(
              onPressed: () {
                var email = emailController.text;
                print('${email}');
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
    );
  }
}
