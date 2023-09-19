import 'package:explore/providers/my_places.dart';
import 'package:explore/view/colors.dart';
import 'package:explore/view/widgets/card_local.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Icon(Icons.add),
          backgroundColor: gray,
        ),

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

            FutureBuilder(
              future: Provider.of<MyPlaces>(context, listen: false).loadPlaces(),
              builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator()) 
              : Consumer<MyPlaces>(
                // child: Container(
                //   child: Text('Nenhum Local Cadastrado')
                // ),
                builder: (context, value, child) {
                  if(value.itemsCount == 0){
                    return const Center(child: Text('Nenhum local Cadastrado :('));
                  }
                  return SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.itemsCount,
                        separatorBuilder: (context, index) => const SizedBox(width: 12,),
                        itemBuilder: (context, index) => CardLugar(place: value.itemByIndex(index)),
                      ),
                    ),
                  );
                }
              ),
            )
            ],
          ),
        );
      }
}
