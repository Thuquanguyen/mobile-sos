import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_wolrd/model/station.dart';
import 'package:hello_wolrd/screen/main/widget_contact.dart';
import 'package:hello_wolrd/screen/main/widget_form_search.dart';
import 'package:provider/provider.dart';

class WidgetGoogleMap extends StatelessWidget {
  static const routerName = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MapView());
  }
}

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Geolocator geolocator = Geolocator();
  Position userLocation;


  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Station>(context, listen: false).fetDataMaker(),
      builder: (context, data) {
        if (data.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator());
        } else if (data.error != null) {
          return Center(child: Text("Error : ${data.error}"));
        } else {
          return Consumer<Station>(
            builder: (context, data, child) => Stack(
              children: <Widget>[
                GoogleMap(
                  initialCameraPosition: data.cameraPosition,
                  zoomGesturesEnabled: true,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {},
                  markers: data.itemsMarker.values.toSet(),
                  onTap: (LatLng lang) {
                    data.setContact();
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  trafficEnabled: true,
                ),
                FormSearch(data: data.itemSearchStation),
//                FormSetting(),
                data.isContact
                    ? (data.station != null
                        ? ListContact(
                            stationItem: data.station,
                          )
                        : [])
                    : Container(),
              ],
            ),
          );
        }
      },
    );
  }

//  Future<Position> _getLocation() async {
//    var currentLocation;
//    try {
//      currentLocation = await geolocator.getCurrentPosition(
//          desiredAccuracy: LocationAccuracy.best);
//    } catch (e) {
//      currentLocation = null;
//    }
//    return currentLocation;
//  }
}
