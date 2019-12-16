import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/station_provider.dart';
import 'package:hello_wolrd/model/station_item.dart';
import 'package:hello_wolrd/widget/item_list_contact.dart';
import 'package:provider/provider.dart';

class ListContact extends StatelessWidget {
  final StationItem stationItem;

  const ListContact({Key key, this.stationItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: Provider.of<Station>(context).isContact,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height / 4.5,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 6 / 7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                child: ItemContact(
                  name: stationItem.name,
                  urlImage: stationItem.imageList[0],
                  dateTime: "25/11/2019",
                  lat: stationItem.lat,
                  long: stationItem.long,
                  numberPhone: stationItem.phoneNumber[0],
                  address: stationItem.address,
                  star: stationItem.rate,
                  idStation: stationItem.id,
                  isFavorite: Provider.of<Station>(context).isFavorite,
                  phone: stationItem.phoneNumber[0],
                  email: stationItem.email,
                  website: stationItem.website,
                  confirm: stationItem.confirmAddress,
                  about: stationItem.about,
                ),
              ),
            ),
          ),
        ));
  }
}
