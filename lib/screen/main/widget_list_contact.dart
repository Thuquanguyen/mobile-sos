import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/StationItem.dart';
import 'package:hello_wolrd/widget/item_list_contact.dart';

class ListContact extends StatelessWidget {
  final List<StationItem> list;

  const ListContact({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height / 4.5,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 4 / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                child: ItemContact(
                  name: list[index].name,
                  urlImage: list[index].imageList[0],
                  dateTime: "25/11/2019",
                  numberPhone: list[index].phoneNumber[0],
                  address: list[index].address,
                  start: list[index].rate,
                  id: list[index].id,
                ),
              ),
            );
          },
          itemCount: list.length,
        ),
      ),
    );
  }
}
