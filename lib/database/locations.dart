import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyAhbkuL8LXvk8MhwfW9N-HPhNGgjYW6aSI';

class Locations{
  static String generateLocationPreview({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=400x400&key=$GOOGLE_API_KEY';
  }

  static Future<String> getAdress(LatLng position) async{
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$GOOGLE_API_KEY');
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}