import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ControllerLogin extends GetxController{

  late TextEditingController textEditingControllerEmail, textEditingControllerPassword;
  

  @override
  void onInit() {
    // TODO: implement onInit
    textEditingControllerEmail = TextEditingController();
    textEditingControllerPassword = TextEditingController();
    textEditingControllerEmail.text = "";
    textEditingControllerPassword.text = "";

    super.onInit();
  }

  // void logar(){
  //   if(_formKey.currentState!.validate()){
  //     print('EXECutouuuu');
  //   }
  // }
}