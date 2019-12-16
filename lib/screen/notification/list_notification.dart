import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hello_wolrd/data/NotificationData.dart';
import 'package:hello_wolrd/widget/item_list_notification.dart';

// ignore: must_be_immutable
class ListNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationView();
  }
}

class NotificationView extends StatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  var list = NotificationData.list;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemExtent: 135.0,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(list[index].id),
                    child: Container(
                        child: ItemListNotification(data: list[index]),
                        color: index % 2 == 0 ? Colors.white30 : Colors.white),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (result) {
                      print(index);
                    },
                  );
                },
                itemCount: list.length)));
  }
}
