import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';

class Localization {
  double? latitude;
  double? longitude;
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
  String? map;
  // Float? rating;

  Place({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.locale,
    required File image,

    // @required this.rating
  });

  Place.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description};
  }
}
