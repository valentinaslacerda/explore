import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerLogin extends GetxController{

  late TextEditingController textEditingControllerEmail, textEditingControllerPassword;
  

  @override
  void onInit() {
    // TODO: implement onInit
    textEditingControllerEmail = TextEditingController();
    textEditingControllerPassword = TextEditingController();
    textEditingControllerEmail.text = "";
    textEditingControllerPassword.text = "";
    verificarUsuario().then((temUser){
        if(temUser){
          print('Tem usuário');
        }else{
          print('Não tem usuário');
        }
      });
    @override
    onInit(){
      super.onInit();
      
    }
    update();
  }

    Future<bool> verificarUsuario() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    String? token = _sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  // void logar(){
  //   if(_formKey.currentState!.validate()){
  //     print('EXECutouuuu');
  //   }
  // }
}