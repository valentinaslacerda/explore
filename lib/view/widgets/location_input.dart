import 'package:explore/database/locations.dart';
import 'package:explore/view/colors.dart';
import 'package:explore/view/pages/view_map.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? previewUrl;

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    //print(Geolocator.getCurrentPosition());
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getCurrentLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);

    final staticMapImage = Locations.generateLocationPreview(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );

    setState(() {
      previewUrl = staticMapImage;
    });
  }

  Future<void> selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push(MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => ViewMap(),
    ));

    if (selectedLocation == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: green)),
          child: previewUrl == null
              ? Text('Nenhuma Localização')
              : Image.network(
                  previewUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                final locData = Location().getLocation();
                var staticMapImage;
                getUserCurrentLocation().then((value) async {
                  staticMapImage = Locations.generateLocationPreview(
                      latitude: value.latitude, longitude: value.longitude);
                  setState(() {
                    previewUrl = staticMapImage;
                  });
                  print(value.latitude.toString() +
                      " " +
                      value.longitude.toString());
                });
              },
              icon: Icon(Icons.place_outlined),
            ),
            SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: () {
                selectOnMap();
              },
              icon: Icon(Icons.map),
            )
          ],
        )
      ],
    );
  }
}
