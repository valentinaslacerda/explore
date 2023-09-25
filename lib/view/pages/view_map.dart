import 'package:explore/models/lugar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewMap extends StatefulWidget {
  
  
  ViewMap({super.key});

  @override
  State<ViewMap> createState() => _ViewMapState();
}


class _ViewMapState extends State<ViewMap> {
  bool? isReadonly = false;
  Localization? initialLocation = Localization(
      latitude: -5.2067022, longitude: -37.3237845, address: 'nenhum');

  LatLng? pickedPosition;

  void selectPosition(LatLng position){
    setState(() {
      pickedPosition = position;
    });
  }
  
  

  Future<Position?> posicaoAtual() async{
    
    bool ativado = await Geolocator.isLocationServiceEnabled();
    if(ativado){
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      );
      return position;
    }
    else{
      Future.error('erro');
    }
    return null;
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione no mapa'),
        centerTitle: true,
        actions: [
          if(!isReadonly!)
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: pickedPosition == null ? null : () {
              Navigator.of(context).pop(pickedPosition);
            
            },

          )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            initialLocation!.latitude!,
            initialLocation!.longitude!
          ),
          zoom: 14,
          
        ),
        onTap: isReadonly! ? null : selectPosition,
        markers: pickedPosition == null
          ? <Marker>{}
          : {
              Marker(
                markerId: MarkerId('p1'),
                position: pickedPosition!,
            )
        },
      ),
    );
  }
}