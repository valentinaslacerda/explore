import 'package:explore/view/colors.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4e4e4),
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 70),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffd3d3d3)),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(children: [
                    SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Nome do local',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      cursorColor: green,
                      decoration: const InputDecoration(
                          prefixIconColor: green,
                          border: OutlineInputBorder(),
                          hintText: "Digite o local em que você está"),
                    ),
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Descrição',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: TextFormField(
                        textAlign: TextAlign
                            .left, // Define o alinhamento horizontal para a esquerda
                        textAlignVertical: TextAlignVertical.top,
                        cursorColor: green,
                        decoration: InputDecoration(
                          prefixIconColor: green,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 70.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 57.0,
                          height: 57.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: green,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.pin_drop,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                        Container(
                          width: 57.0,
                          height: 57.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: green,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: green,
                          minimumSize: const Size(double.infinity, 50)),
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
