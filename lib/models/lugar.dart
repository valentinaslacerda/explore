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
  String? name;
  String? description;
  Localization? locale;
  File? image;
  Float? rating;

  Place(
      {@required this.name,
      @required this.description,
      @required this.locale,
      @required this.image,
      @required this.rating});
}
