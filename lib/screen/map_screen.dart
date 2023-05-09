import 'dart:async';

import 'package:flutter/material.dart';
import 'package:friends/resource/app_color.dart';
import 'package:friends/widget/custom_btn_about.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
const kStartPosition = LatLng(18.488213, -69.959186);
const kSantoDomingo = CameraPosition(target: kStartPosition, zoom: 15);
const kMarkerId = MarkerId('MarkerId1');
const kDuration = Duration(seconds: 2);
const kLocations = [
  kStartPosition,
//  LatLng(18.488101, -69.957995),
  // LatLng(18.489210, -69.952459),
  // LatLng(18.487307, -69.952759),
  // LatLng(18.487308, -69.952759),
];
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final markers = < Marker>{};
   Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  final stream = Stream.periodic(kDuration, (count) => kLocations[count])
      .take(kLocations.length);


 // GoogleMapController? mapController; //contrller for Google map
 //  final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation = LatLng(27.7089427, 85.3086209);
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: <Widget>[
          Animarker(
            curve: Curves.bounceOut,
            rippleRadius: 0.2,
            useRotation: true,
            duration: Duration(milliseconds: 2300),
            mapId: mapController.future
                .then<int>((value) => value.mapId), //Grab Google Map Id
         //   markers: markers.values.toSet(),
            child:  GoogleMap(

              zoomGesturesEnabled: true, //enable Zoom in, out on map
              initialCameraPosition: const CameraPosition( //innital position in map
                target: showLocation, //initial position
                zoom: 15.0, //initial zoom level
              ),
              markers: getmarkers(), //markers to show on map
              mapType: MapType.normal, //map type
              onMapCreated: (controller) { //method called when map is created
                setState(() {
                  mapController = controller as Completer<GoogleMapController>;
                });
              },
              ),

          ),

          Padding(
            padding: const EdgeInsets.only(top: 36,left: 16,right: 16),
            child: Container(width:MediaQuery.of(context).size.width/1,height:MediaQuery.of(context).size.height/8,decoration: const BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24)
            ),),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children:const [

                        Text('Location (within 10 Km)',style: TextStyle(fontSize: 12,),),
                       SizedBox(height: 16),
                            Text('Jakarta,Indonesia',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                      ] ),
                    ),

                    Expanded(flex:2,child: CustomBtnAbout(title: 'change', onPressed: (){},icons: 'assets/image/edit.png',color: AppColors.colorApp,))
                  ],
                ),
              ),


            ),

          ),

        ],
      )
    );
  }

  // void newLocationUpdate(LatLng latLng) {
  //   var marker = RippleMarker(
  //       markerId: kMarkerId,
  //       position: latLng,
  //       ripple: true,
  //       onTap: () {
  //         print('Tapped! $latLng');
  //       });
  //   setState(() => markers= marker);
  // }




  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(

          Marker( //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(27.7099116, 85.3132343), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(27.7137735, 85.315626), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Marker Title Third ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(27.8422569, 85.312226), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Marker Title four ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(27.7137735, 85.315626), //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Marker Title five ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }
}
