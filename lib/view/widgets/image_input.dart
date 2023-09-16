import 'dart:io';

import 'package:explore/view/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  ImageInput({super.key, required this.onSelectImage});

  final Function onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File? img;

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
          child: img != null ? Image.file(
            img!,
            width: double.infinity,
            fit: BoxFit.cover,
          ): const Text('Nenhuma Imagem!'),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: IconButton(
            onPressed: () {
              tirarFoto();
            },
            icon: const Row(
              children: [
                Icon(Icons.camera_alt_rounded, color: gray,),
                SizedBox(width: 6,),
                Text('Tirar Foto', style: TextStyle(color: green),)
              ],
            ),
            
          ),
        )
      ],
    );
  }
}