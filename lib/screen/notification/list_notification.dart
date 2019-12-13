import 'package:flutter/material.dart';
import 'package:hello_wolrd/data/NotificationData.dart';
import 'package:hello_wolrd/widget/item_list_notification.dart';

class ListNotification extends StatelessWidget {
  var list = NotificationData.list;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemExtent: 100.0,
                itemBuilder: (context, index) {
                  return Container(
                      child: ItemListNotification(data: list[index]),
                      color: index % 2 == 0 ? Colors.white30 : Colors.white);
                },
                itemCount: list.length)));
  }
}
