import 'package:explore/controllers/controller_home.dart';
import 'package:explore/view/widgets/card_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerHome>(
      init: ControllerHome(),
      builder: (h) {
        return Scaffold(
        
        backgroundColor: const Color(0xffF7F7F7),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              height: 350,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/home.jpg'),
                    fit: BoxFit.cover),
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Explore & Compartilhe",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold),
                ),
              ),
              
              
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CardLugar(place: h.listLugares[index],),
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12);
                    },
                  itemCount: h.listLugares.length
                  ),
                ),
              ),
            //CardLugar()
            ],
          ),
        );
      },

      
    );
  }
}
