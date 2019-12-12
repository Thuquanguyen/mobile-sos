import 'package:flutter/cupertino.dart';

class StationItem {
  int id;
  String name;
  String address;
  String email;
  String website;
  String about;
  String openAndCloseTime;
  double lat;
  double long;
  double rate;
  int confirmAddress;
  int favorite;
  List<dynamic> imageList;
  List<dynamic> phoneNumber;
  List<dynamic> supportDetails;
  List<dynamic> workingDay;

  StationItem(
      {@required this.id,
      @required this.name,
      @required this.address,
      @required this.email,
      @required this.website,
      @required this.about,
      @required this.openAndCloseTime,
      @required this.lat,
      @required this.long,
      @required this.rate,
      @required this.confirmAddress,
      @required this.favorite,
      @required this.imageList,
      @required this.phoneNumber,
      @required this.supportDetails,
      @required this.workingDay});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'address': this.address,
      'email': this.email,
      'website': this.website,
      'about': this.about,
      'openAndCloseTime': this.openAndCloseTime,
      'lat': this.lat,
      'long': this.long,
      'rate': this.rate,
      'confirmAddress': this.confirmAddress,
      'favorite': this.favorite,
      'imageList': null,
      'phoneNumber': null,
      'supportDetails': null,
      'workingDay': null,
    };
  }

  factory StationItem.fromMap(Map<String, dynamic> map) {
    return new StationItem(
      id: map['id'] as int,
      name: map['name'] as String,
      address: map['address'] as String,
      email: map['email'] as String,
      website: map['website'] as String,
      about: map['about'] as String,
      openAndCloseTime: map['openAndCloseTime'] as String,
      lat: map['lat'] as double,
      long: map['long'] as double,
      rate: map['rate'] as double,
      confirmAddress: map['confirmAddress'] as int,
      favorite: map['favorite'] as int,
      imageList: map['imageList'] as List<dynamic>,
      phoneNumber: map['phoneNumber'] as List<dynamic>,
      supportDetails: map['supportDetails'] as List<dynamic>,
      workingDay: map['workingDay'] as List<dynamic>,
    );
  }

}
