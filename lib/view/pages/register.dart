import 'package:explore/controllers/controller_register.dart';
import 'package:explore/view/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerRegister>(
      init: ControllerRegister(),
      builder: (r) {
        return Scaffold(
        backgroundColor: const Color(0xffe4e4e4),
        body: SafeArea(
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 80),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffd3d3d3)),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(children: [
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Nome do local',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
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
                      const SizedBox(height: 5),
                      TextFormField(
                        textAlign: TextAlign
                            .left, // Define o alinhamento horizontal para a esquerda
                        textAlignVertical: TextAlignVertical.top,
                        cursorColor: green,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          prefixIconColor: green,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            
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
                          const SizedBox(width: 40),
                          Container(
                            width: 57.0,
                            height: 57.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: green,
                            ),
                            child: IconButton(
                              onPressed: () {
                                r.tirarFoto();
                              },
                              icon: Icon(
                                Icons.camera_alt,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      TextButton(
                        onPressed: () {

                        },
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
      },
  
    );
  }
}
