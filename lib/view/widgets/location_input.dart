import 'package:explore/database/locations.dart';
import 'package:explore/view/colors.dart';
import 'package:explore/view/pages/view_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onselectPosition});
  final Function onselectPosition;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? previewUrl;

  void showMap(double lat, double lng){
    final staticMapImage = Locations.generateLocationPreview(
      latitude: lat,
      longitude: lng,
    );

    setState(() {
      previewUrl = staticMapImage;
    });
  }

  Future<void> getCurrentLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);

    showMap(locData.latitude!, locData.longitude!);
    widget.onselectPosition(LatLng(locData.latitude!, locData.longitude!));
    
  }

  Future<void> selectOnMap() async {
    final LatLng selectedPosition = await Navigator.of(context).push(MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => ViewMap(),
    ));

    // if (selectedPosition == null) {
    //   return;
    // }    

    showMap(selectedPosition.latitude, selectedPosition.longitude);
    widget.onselectPosition(selectedPosition);
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
                selectOnMap();
              },
              icon: const Icon(Icons.map, color: green,),
            ),
            // const SizedBox(
            //   width: 4,
            // ),
            const Text('Selecione no mapa', style: TextStyle(color: green)),
          ],
        )
      ],
    );
  }
}
