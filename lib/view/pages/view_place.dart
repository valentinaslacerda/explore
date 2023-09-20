import 'package:explore/view/colors.dart';
import 'package:flutter/material.dart';

import '../../models/lugar.dart';

class ViewPlace extends StatelessWidget {
  ViewPlace({super.key, required this.place});

  final Place? place;

  @override
  Widget build(BuildContext context) {
    if (place == null) {
      // Handle the case where place is null, e.g., show an error message or return a loading indicator.
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
          centerTitle: true,
          backgroundColor: gray,
        ),
        body: Center(
          child: Text('Place data is missing.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            place!.name ?? 'No Name'), // Use a default value if name is null
        centerTitle: true,
        backgroundColor: gray,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
                /*image: DecorationImage(
                image: place?.image != null
                    ? FileImage(place!.image! as File)
                    : AssetImage(
                        'assets/images/fundo.jpg'), // Use a placeholder image if image is null
                fit: BoxFit.cover,
              ),*/
                ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                place?.name ?? 'No Name', // Use a default value if name is null
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              place?.description ??
                  'No Description', // Use a default value if description is null
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                Icon(
                  Icons.place_sharp,
                  color: green,
                  size: 28,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Nome - Pais',
                  style: TextStyle(
                    fontSize: 18,
                    color: green,
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
