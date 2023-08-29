import 'package:explore/view/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 110),
            Text(
              'Explore e Compartilhe.',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xffd3d3d3))),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'Fazer login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff25262C),
                    ),
                  ),
                  SizedBox(height: 35),
                  Align(alignment: Alignment.topLeft, child: Text('Email')),
                  TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 30),
                  Align(alignment: Alignment.topLeft, child: Text('Senha')),
                  TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 9),
                  Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Esqueceu sua senha?'),
                      )),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Não tem uma conta?'),
                      TextButton(
                        onPressed: () {},
                        child: Text('Registre-se'),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      'Continuar',
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      backgroundColor: green,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
