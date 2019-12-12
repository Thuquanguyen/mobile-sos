import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_wolrd/database/database_helpers.dart';
import 'package:hello_wolrd/model/station.dart';
import 'package:hello_wolrd/model/station_item.dart';
import 'package:hello_wolrd/screen/details/widget_details_station.dart';
import 'package:provider/provider.dart';

class ItemContact extends StatelessWidget {
  final int idStation;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String website;
  final double lat;
  final double long;
  final int confirm;
  final String about;
  final String urlImage;
  final String dateTime;
  final String numberPhone;
  final int isFavorite;
  final double star;

  const ItemContact(
      {Key key,
      this.name,
      this.address,
      this.urlImage,
      this.dateTime,
      this.numberPhone,
      this.isFavorite,
      this.star,
      this.idStation,
      this.phone,
      this.email,
      this.website,
      this.confirm,
      this.about,
      this.lat,
      this.long,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Hero(
          tag: "hero$idStation",
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: <Widget>[
                Flexible(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: ListTile(
                            title: Text(
                              name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(address),
                          ),
                          flex: 3,
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                  child: Icon(Provider.of<Station>(context).isFavorite==0?Icons.bookmark_border:Icons.bookmark,
                                      color: Colors.blue),
                                  onTap: () {
                                    Provider.of<Station>(context).setFavorite(idStation);
                                    _save(context);
                                  }),
                              Text(
                                "5.5 KM",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    flex: 2),
                Flexible(
                  flex: 3,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(128, 128, 0, 0.8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Icon(Icons.star, color: Colors.white),
                              ),
                              Center(
                                  child: Text(
                                "$star Start",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: ClipOval(
                                child: Image.network(urlImage,
                                    fit: BoxFit.cover, width: 76, height: 76))),
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                  child: Text(numberPhone,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Center(
                                  child: RaisedButton(
                                      color: Colors.blue,
                                      onPressed: () {
                                      },
                                      child: Text("Call Now",
                                          style:
                                              TextStyle(color: Colors.white))))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(DetailsStation.routeName, arguments: idStation);
        });
  }

  _save(BuildContext context) async {
    StationItem stationItem = StationItem(
        id: idStation,
        name: name,
        address: address,
        email: email,
        website: website,
        about: about,
        lat: lat,
        long: long,
        openAndCloseTime: dateTime,
        rate: star,
        confirmAddress: confirm,
        favorite: Provider.of<Station>(context).isFavorite,
        imageList: [],
        phoneNumber: [],
        supportDetails: [],
        workingDay: []);
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    int id = await databaseHelper.insert(stationItem);
    print('inserted row: $id');
  }

}
