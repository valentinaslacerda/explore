import 'dart:convert';
import 'dart:io';

import 'package:explore/models/lugar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ControllerHome extends GetxController {
  final controllerName = TextEditingController();
  final controllerDesc = TextEditingController();

  ImagePicker imagePicker = ImagePicker();

  File? imagemArmazenada;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    readData().then((value) {
      listLugares = json.decode(value);
      update();
    });
  }

  void addPlace(){
    Place newPlace = Place(name: 'dddddd', description: 'qqqqqqq');
    listLugares.add(newPlace);
    print(listLugares[3].toJson());
    // Map<String, dynamic> newPlace = Map();
    // newPlace['name'] = controllerName.text;
    // controllerName.text = "";
    // newPlace['description'] = controllerDesc.text;
    // controllerDesc.text = "";
    // listLugares.add(newPlace as Place);
    // saveData();
    update();
  }

  Future<File> getFile() async {
    final directory = await getApplicationCacheDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> saveData() async{
    String data = json.encode(listLugares);
    final file = await getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async{
    try{
      final file = await getFile();
      return file.readAsString();
    } catch(e){
      return "erro";
    }
  }

  void tirarFoto() async {
    XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (image == null) return;

    imagemArmazenada = File(image.path);
    update();
  }
  // final controllerName = TextEditingController();
  // final controllerDesc = TextEditingController();

  List<Place> listLugares = [
    Place(
        name: 'Praia',
        description:
            'Lorem ipsum dolor sit amet. Non autem amet sit quibusdam iste ut ipsam necessitatibus est minima perferendis et corporis omnis. Aut rerum omnis id odio voluptas vel voluptatem illum in vero sunt est temporibus quia ea minima harum aut quis sapiente.'),
    Place(
        name: 'Tibau',
        description:
            'Lorem ipsum dolor sit amet. Non autem amet sit quibusdam iste ut ipsam necessitatibus est minima perferendis et corporis omnis. Aut rerum omnis id odio voluptas vel voluptatem illum in vero sunt est temporibus quia ea minima harum aut quis sapiente.'),
    Place(
        name: 'Baraúna',
        description:
            'Lorem ipsum dolor sit amet. Non autem amet sit quibusdam iste ut ipsam necessitatibus est minima perferendis et corporis omnis. Aut rerum omnis id odio voluptas vel voluptatem illum in vero sunt est temporibus quia ea minima harum aut quis sapiente.')
  ];
}
