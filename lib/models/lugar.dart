import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';

class Localization {
  Double? latitude;
  Double? longitude;
  String? address;

  Localization(
      {@required this.latitude,
      @required this.longitude,
      @required this.address});
}

class Place {
  String? id;
  String? name;
  String? description;
  File? image;
  Localization? locale;
  // Float? rating;

  Place(
      {
        @required this.id,
        @required this.name,
        @required this.description,
        @required this.locale,
        @required this.image,
        // @required this.rating
      });

  Place.fromJson(Map<String, dynamic> json)
  : name = json['name'],
  description = json['description'];


  Map<String, dynamic> toJson(){
    return{
      'name': name,
      'description': description
    };
  }
}
