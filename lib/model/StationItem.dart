import 'package:flutter/cupertino.dart';

class StationItem {
  String id;
  String name;
  String address;
  String email;
  String website;
  String about;
  String openAndCloseTime;
  double lat;
  double long;
  int rate;
  int confirmAddress;
  bool favorite;
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


}
