import 'package:explore/view/colors.dart';
import 'package:flutter/material.dart';

import '../../models/lugar.dart';

class ViewPlace extends StatelessWidget {
  ViewPlace({super.key, required this.place});

  Place? place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place!.name!),
        centerTitle: true,
        backgroundColor: gray,
      ),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              height: 350,
              width: double.infinity,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: FileImage(place!.image!), //Imagem do lugar
                  fit: BoxFit.cover
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  place!.name!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold),
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              place!.description!,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                const Icon(Icons.place_sharp, color: green, size: 28, ),
                const SizedBox(width: 8,),
                Text(
                  '${place!.locale!.address}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: green
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}