import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_wolrd/model/Station.dart';
import 'package:hello_wolrd/screen/main/widget_contact.dart';
import 'package:hello_wolrd/screen/main/widget_form_search.dart';
import 'package:provider/provider.dart';

class WidgetGoogleMap extends StatelessWidget {
  static const routerName = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
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
                  onMapCreated: (GoogleMapController controller) {

                  },
                  onCameraMove: (CameraPosition camera){
                    data.cameraPosition;
                  },
                  markers: data.itemsMarker.values.toSet(),
                  myLocationButtonEnabled: false,
                  onTap: (LatLng lang){
                    data.setContact();
                  },
                ),
                FormSearch(data: data.itemSearchStation),
//                FormSetting(),
                data.isContact
                    ? (data.station != null
                        ? ListContact(
                            stationItem: data.station,
                          )
                        : [])
                    : Container()
              ],
            ),
          );
        }
      },
    ));
  }
}
