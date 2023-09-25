import 'package:explore/view/colors.dart';
import 'package:flutter/material.dart';

import '../../models/lugar.dart';

class ViewPlace extends StatelessWidget {
  const ViewPlace({super.key, required this.place});

  final Place? place;

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
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  place!.description!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                  ),
                ),
                const SizedBox(height: 26),

                const Row(
                  children: [
                    Icon(Icons.location_pin),
                    SizedBox(width: 8,),
                    Text('Endereço: ', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
                  ],
                ),
                const SizedBox(height: 8,),
                Text(
                  '${place!.locale!.address}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 19, color: green),
                )
              ],
            ),
          ),

          
        ],
      ),
    );
  }
}