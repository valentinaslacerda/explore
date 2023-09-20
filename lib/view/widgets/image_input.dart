import 'dart:io';

import 'package:explore/view/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  ImageInput({super.key, required this.onSelectImage});

  final Function onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();

  downloadImage(String imageUrl) {}
}

class _ImageInputState extends State<ImageInput> {
  File? img;
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future<void> upload(String path) async {
    File file = new File(path);
    try {
      String ref = 'images/img-${DateTime.now().toString()}.jpg';
      await storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  Future<void> downloadImage(String imageUrl) async {
    try {
      final Reference ref = FirebaseStorage.instance.ref(imageUrl);
      final File localFile = File(
          '${(await syspath.getApplicationDocumentsDirectory()).path}/imagem.jpg');

      await ref.writeToFile(localFile);
    } on FirebaseException catch (e) {
      print('Erro no download: ${e.code}');
    }
  }

  tirarFoto() async {
    final ImagePicker picker = ImagePicker();
    XFile imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    setState(() {
      img = File(imageFile.path);
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    String fileName = path.basename(img!.path);
    final savedImg = await img!.copy('${appDir.path}/${fileName}');
    widget.onSelectImage(savedImg);
    if (savedImg != null) {
      await upload(savedImg.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: green),
          ),
          alignment: Alignment.center,
          child: img != null
              ? Image.file(
                  img!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text('Nenhuma Imagem!'),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              tirarFoto();
            },
            icon: const Row(
              children: [
                Icon(
                  Icons.camera_alt_rounded,
                  color: gray,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Tirar Foto',
                  style: TextStyle(color: green),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
