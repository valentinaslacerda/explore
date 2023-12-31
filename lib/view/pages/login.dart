import 'package:explore/view/colors.dart';
import 'package:explore/view/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                  child: Column(
                    children: [
                      const Text(
                        'Fazer login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff25262C),
                        ),
                      ),
                      const SizedBox(height: 35),
                      const Align(
                          alignment: Alignment.topLeft, child: Text('Email')),
                      TextFormField(
                        cursorColor: green,
                        decoration: const InputDecoration(
                            prefixIconColor: green,
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                            hintText: "Digite seu email"),
                        controller: controllerEmail,
                        validator: Validatorless.multiple([
                          Validatorless.required("Email é obrigatório"),
                          Validatorless.email("Digite um email válido")
                        ]),
                      ),
                      const SizedBox(height: 30),
                      const Align(
                          alignment: Alignment.topLeft, child: Text('Senha')),
                      TextFormField(
                        cursorColor: Colors.green,
                        decoration: const InputDecoration(
                            prefixIconColor: green,
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.password),
                            hintText: "Digite sua senha"),
                        keyboardType: TextInputType.emailAddress,
                        controller: controllerPassword,
                        obscureText: true,
                        validator: Validatorless.multiple([
                          Validatorless.required("Senha é obrigatória"),
                          Validatorless.min(
                              6, "Sua senha deve ter pelo menos 6 caracteres")
                        ]),
                      ),
                      const SizedBox(height: 8),
                      Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              //TELA DE CADASTRO
                            },
                            child: const Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Não tem uma conta?',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/access');
                            },
                            child: const Text(
                              'Registre-se',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ],
                      ),
                     
                      TextButton(
                        onPressed: () {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: controllerEmail.text.trim(),
                                  password: controllerPassword.text.trim())
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          });
                        },
                        style: TextButton.styleFrom(
                            //padding: EdgeInsets.symmetric(horizontal: 80),
                          backgroundColor: green,
                          minimumSize: const Size(double.infinity, 40)
                        ),
                        child: const Text(
                          'Continuar',
                          style: TextStyle(
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),

                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
