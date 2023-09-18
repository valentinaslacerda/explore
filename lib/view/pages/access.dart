import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class Access extends StatelessWidget {
  final controller_nome = TextEditingController();
  final controller_email = TextEditingController();
  final controller_senha = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 40),
            const Text(
              'EXPLORE E COMPARTILHE.',
              style: TextStyle(
                  fontSize: 36, color: green, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffd3d3d3)),
                  borderRadius: BorderRadius.circular(7)),
              padding: const EdgeInsets.all(24),
              child: Column(children: [
                Text(
                  'Criar conta',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff25262C),
                  ),
                ),
                const SizedBox(height: 35),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Nome'),
                ),
                TextFormField(
                  cursorColor: green,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Digite o seu nome"),
                  controller: controller_nome,
                ),
                const SizedBox(height: 30),
                const Align(alignment: Alignment.topLeft, child: Text('Email')),
                TextFormField(
                  cursorColor: Colors.green,
                  decoration: const InputDecoration(
                    prefixIconColor: green,
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    hintText: "Digite seu endereço de email",
                  ),
                  controller: controller_email,
                ),
                const SizedBox(height: 30),
                const Align(alignment: Alignment.topLeft, child: Text('Senha')),
                TextFormField(
                  cursorColor: Colors.green,
                  decoration: const InputDecoration(
                      prefixIconColor: green,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password),
                      hintText: "Digite sua senha"),
                  controller: controller_senha,
                ),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Já tem uma conta?',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
                //SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: controller_email.text.trim(),
                            password: controller_senha.text.trim())
                        .then((value) {
                      Navigator.pushNamed(context, '/home');
                    }).onError((error, stackTrace) {
                      print("Error");
                    });
                  },
                  style: TextButton.styleFrom(
                      //padding: EdgeInsets.symmetric(horizontal: 80),
                      backgroundColor: green,
                      minimumSize: const Size(double.infinity, 40)),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ]),
            )
          ]),
        ),
      )),
    );
  }
}
