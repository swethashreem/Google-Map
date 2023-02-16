import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng currentLocation=LatLng(10.0735, 78.7732);

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController mapController;
Map<String ,Marker> _markers={};

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:const CameraPosition(
        // target: LatLng(10.0735,78.7732),
        target: currentLocation,
        zoom: 14.57344),
      onMapCreated: (controller) {
       mapController=controller;
       addMarker('test',currentLocation);
      },
      markers:_markers.values.toSet() ,),

                               );
    
  }
  addMarker(String id, LatLng location){
var marker=Marker(
  markerId: MarkerId(id),
  position: location,
  infoWindow:const InfoWindow(
    title: 'Title of place',
    snippet: 'some description of the place',
  ));
  _markers[id]=marker;
  setState(() {
    
  });
  }
}
