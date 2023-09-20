import 'dart:io';
import 'dart:math';

import 'package:explore/database/db_util.dart';
import 'package:explore/database/locations.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/lugar.dart';

class MyPlaces with ChangeNotifier{
  List<Place> items = [];
  
  Future<void> loadPlaces() async{
    final dbList = await DbUtil.getData('places');
    items = dbList.map(
      (item) => Place(
        id: item['id'],
        name: item['name'],
        description: item['description'],
        image: File(item['image']),
        locale: Localization(
          latitude: item['latitude'],
          longitude: item['longitude'],
          address: item['address']
        ),
        
      )
    ).toList();
    notifyListeners();
  }
  List<Place> get itens{
    return [...items];

  }

  int get itemsCount{
    return items.length;
  }

  Place itemByIndex(int index){
    return items[index];
  }

  void addPlace(String name, String description, File image, LatLng position) async{

    String address = await Locations.getAdress(position);
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      name: name,
      image: image,
      description: description,
      locale: Localization(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address
      ),
      //map: map
    );

    items.add(newPlace);
    DbUtil.insert('places', {
      'id': newPlace.id,
      'name': newPlace.name,
      'description': newPlace.description,
      'image': newPlace.image!.path,
      'latitude': position.latitude,
      'longitude': position.longitude,
      'address': address
    });
    notifyListeners();
    
  }
}