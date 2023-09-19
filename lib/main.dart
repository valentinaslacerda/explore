import 'package:explore/providers/my_places.dart';
import 'package:explore/view/pages/access.dart';
import 'package:explore/view/pages/home.dart';
import 'package:explore/view/pages/login.dart';
import 'package:explore/view/pages/register.dart';
import 'package:explore/view/pages/view_home.dart';
import 'package:explore/view/pages/view_place.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/lugar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyPlaces(),
      child: MaterialApp(
        title: "Explore and Share",
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (context) => Home(),
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/access': (context) => Access(),
          //'/viewplace':(context) => ViewPlace(place: null,),
        },
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/viewplace':
            final args = settings.arguments as Place;
            return MaterialPageRoute(builder: (context) {
              return ViewPlace(place: args,);
            },);
            
          }
        },
        initialRoute: '/home',
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
