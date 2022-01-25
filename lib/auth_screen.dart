import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  String? error = null;

  void _auth() {
    final login = _loginController.text;
    final password = _passwordController.text;
    if (login == '1234567890' && password == 'qwerty1234') {
      error = null;
      Navigator.of(context).pushNamed('/home');
    } else {
      error = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(color: Color(0xFFeceff1), width: 2));
    const linkTextStyle = TextStyle(fontSize: 18, color: Colors.blue);

    final error = this.error;

    return MaterialApp(
      home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const SizedBox(
                    width: 110,
                    height: 84,
                    child: Image(
                      image: AssetImage('images/logo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Введите логин в виде 10 цифр номера телефона',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _loginController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'Телефон',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'Пароль',
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                    width: 154,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: _auth,
                      child: const Text('Войти'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF0079D0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  if (error != null)
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        error,
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ),
                  InkWell(
                      child: const Text(
                        'Регистрация',
                        style: linkTextStyle,
                      ),
                      onTap: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      child: const Text(
                        'Забыли пароль?',
                        style: linkTextStyle,
                      ),
                      onTap: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Для проверки. Логин: 1234567890. Пароль: qwerty1234',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
