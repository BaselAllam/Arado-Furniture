import 'package:arado/models/mainmodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model){
        return Scaffold(
          appBar: AppBar(title: Text('${model.selectedProduct.title}', style: TextStyle(color: Colors.black))),
          body: Container(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(15.508457, 32.522854),
                zoom: 12
              ),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
            ),
          ),
        );
      }
    );
  }
  // searchAdress(String placeName) async {

  //   setState(() {
  //     isMapLoading = true;
  //   });

  //   try{
  //     List<Location> locations = await locationFromAddress(placeName);
  //     final Marker newMarker = Marker(
  //       position: LatLng(locations[0].latitude, locations[0].longitude),
  //       markerId: MarkerId(locations[0].latitude.toString()),
  //     );
  //     setState(() {
  //       location = locations[0];
  //       markers.add(newMarker);
  //       isMapLoading = false;
  //     });
  //   }catch(e){
  //     setState(() {
  //     isMapLoading = true;
  //   });
  //     print(e);
  //   }
  // }
  // checkMap() async {

  //   bool _isEnabled = await Geolocator.isLocationServiceEnabled();
  //   if(_isEnabled == true){
  //     Position _currentLocation = await Geolocator.getCurrentPosition();
  //     Location _newLocation = Location(latitude: _currentLocation.latitude, longitude:_currentLocation.longitude);
  //     setState(() {
  //       location = _newLocation;
  //     });
  //   }
  // }
  // buildMap(double lat, double lang) {
  //   return GoogleMap(
  //     initialCameraPosition: CameraPosition(
  //       target: LatLng(lat, lang),
  //       zoom: 12
  //     ),
  //     myLocationButtonEnabled: true,
  //     myLocationEnabled: true,
  //     mapType: MapType.normal,
  //     markers: Set<Marker>.from(markers)
  //   );
  // }
}