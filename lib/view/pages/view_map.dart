import 'package:explore/models/lugar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewMap extends StatefulWidget {
  ViewMap({super.key });

  @override
  State<ViewMap> createState() => _ViewMapState();
}


class _ViewMapState extends State<ViewMap> {

  Localization? initialLocation = Localization(
    latitude: -23.562436,
    longitude: -46.655005,
    address: 'São Paulo'
  );

  Future<Position?> posicaoAtual() async{
    //LocalPermission permission;

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
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione no mapa'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            initialLocation!.latitude!,
            initialLocation!.longitude!
          ),
          zoom: 14
        ),
      ),
    );
  }
}