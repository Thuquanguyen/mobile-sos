import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello_wolrd/database/database_helpers.dart';
import 'package:hello_wolrd/model/station_item.dart';

class DatabaseStation with ChangeNotifier {
  List<StationItem> _items = [];


  List<StationItem> get items {
    return [..._items];
  }

  Future<void> readDatabase() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    List<StationItem> station = [];
    List<StationItem> stationItem = await helper.queryAllStation();
    if (stationItem == null) {
      return;
    } else {
      stationItem.forEach((stationData){
        station.add(StationItem(
            id: stationData.id,
            name: stationData.name,
            address: stationData.address,
            email: stationData.email,
            website: stationData.website,
            about: stationData.about,
            openAndCloseTime: stationData.openAndCloseTime,
            lat: stationData.lat,
            long: stationData.long,
            rate: stationData.rate,
            confirmAddress: stationData.confirmAddress,
            favorite: stationData.favorite,
            imageList: [],
            phoneNumber: [],
            supportDetails: [],
            workingDay: []));
      });

    }
    _items = station.reversed.toList();
    notifyListeners();
  }
  Future<void> removeItemStation(int id) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    List<StationItem> stationItem = await helper.deleteStation(id);
    if (stationItem == null) {
      return;
    }
    notifyListeners();
  }
  void clear()
  {
    _items = [];
    notifyListeners();
  }
}
