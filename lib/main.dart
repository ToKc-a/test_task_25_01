import 'package:flutter/material.dart';
import 'package:test_task_25_01/screens/auth_screen.dart';
import 'package:test_task_25_01/screens/home_screen.dart';
import 'package:test_task_25_01/screens/logo_screen.dart';
import 'package:test_task_25_01/screens/user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/logo',
      routes: {
        '/logo': (context) => const LogoScreen(),
        '/home': (context) => const HomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/user': (context) => const UserScreen(),
      },
    );
  }
}
