import 'package:explore/view/pages/login.dart';
import 'package:explore/view/pages/register.dart';
import 'package:explore/view/pages/view_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Explore and Share",
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => ViewHome(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
      },
      initialRoute: '/home',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
    );
  }
}
