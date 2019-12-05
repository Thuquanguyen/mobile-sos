import 'dart:convert';import 'package:flutter/cupertino.dart';import 'package:hello_wolrd/model/StationItem.dart';import 'package:http/http.dart' as http;import 'package:google_maps_flutter/google_maps_flutter.dart';class Station with ChangeNotifier {  Map<String, Marker> _itemsMarker = {};  List<StationItem> _itemStation = [];  List<StationItem> get itemStation {    return [..._itemStation];  }  Map<String, Marker> get itemsMarker {    return {..._itemsMarker};  }  Future<void> fetDataMaker() async {    const url = 'https://sos-manage.firebaseio.com/station.json';    final response = await http.get(url);    List<StationItem> loadStation = [];    final extractData = json.decode(response.body) as Map<String, dynamic>;    if (extractData == null) {      return;    }    extractData.forEach((stationId, stationData) {      Marker marker = Marker(          markerId: MarkerId("$stationId"),          position: LatLng(stationData["lat"], stationData["long"]),          infoWindow: InfoWindow(title: stationData["name"]));      loadStation.add(StationItem(          id: stationId,          name: stationData["name"],          address: stationData["address"],          email: stationData["email"],          website: stationData["address"],          about: stationData["about"],          openAndCloseTime: stationData["open_close_time"],          lat: stationData["lat"],          long: stationData["long"],          rate: stationData["rate"],          confirmAddress: stationData["confirm"],          favorite: false,          imageList: stationData["images"],          phoneNumber: stationData["phone_number"],          supportDetails: stationData["support_details"],          workingDay: stationData["working_day"]));      _itemsMarker["m$stationId"] = marker;    });    _itemStation = loadStation.reversed.toList();    notifyListeners();  }  void clear() {    _itemsMarker = {};    _itemStation = [];    notifyListeners();  }}