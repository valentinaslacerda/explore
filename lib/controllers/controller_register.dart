import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ControllerRegister extends GetxController{
  File? imagemArmazenada;

  ImagePicker imagePicker = ImagePicker();

  void tirarFoto() async{
    XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if(image == null) return;

    imagemArmazenada = File(image.path);
    update();
  }
  // var imageFile;

  // void onClickCameraImagem() async {
  //   XFile? xf = await imagePicker.pickImage(
  //       source: ImageSource.camera,
  //       maxHeight: 480,
  //       maxWidth: 640,
  //       imageQuality: 50, // 1-100
  //       preferredCameraDevice: CameraDevice.front);

  //     imageFile = File(xf!.path);
  //   update();
  // }

  // void onClickGaleriaImagem() async {
  //   XFile? f = await imagePicker.pickImage(source: ImageSource.gallery);
  //   imageFile = File(f!.path);
  //   update();
    
  // }
}