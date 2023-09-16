import 'dart:io';

import 'package:flutter/material.dart';

import '../models/lugar.dart';

class MyPlaces with ChangeNotifier{
  List<Place> items = [];
  
  List<Place> get itens{
    return [...items];

  }

  int get itemsCount{
    return items.length;
  }

  Place itemByIndex(int index){
    return items[index];
  }

  void addPlace(String name, String description, File image){
    final newPlace = Place(
      name: name,
      image: image,
      description: description
    );

    items.add(newPlace);
    notifyListeners();
    
  }
}