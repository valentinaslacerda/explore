import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/home.jpg'), fit: BoxFit.cover),
        ),
        height: 400,
        width: double.infinity,
      ),
    );
  }
}
