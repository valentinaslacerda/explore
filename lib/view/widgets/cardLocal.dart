import 'package:explore/view/colors.dart';
import 'package:flutter/material.dart';

class CardLugar extends StatelessWidget {
  const CardLugar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffFFFFFF),
        ),
        height: 191,
        width: 139,
        child: Column(
          children: [
            Container(
              height: 155,
              width: 139,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/fundo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    "Floresta",
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
