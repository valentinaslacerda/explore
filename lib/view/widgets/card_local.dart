import 'package:explore/models/lugar.dart';
import 'package:flutter/material.dart';

class CardLugar extends StatelessWidget {
  CardLugar({super.key, required this.place});

  final Place place;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffFFFFFF),
        ),
        height: 216,
        width: 162,
        child: Column(
          children: [
            Container(
              height: 168,
              width: 162,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: FileImage(place.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    '${place.name}',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff222222),
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
