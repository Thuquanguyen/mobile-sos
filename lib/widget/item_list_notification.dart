import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/notification_item.dart';
import 'package:hello_wolrd/screen/notification/details_notification.dart';

class ItemListNotification extends StatelessWidget {
  final NotificationItem data;

  const ItemListNotification({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          color: data.status == 1 ? Colors.white : Colors.black12,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          margin: const EdgeInsets.only(bottom: 5),
          child: ListTile(
              title: Text(data.title),
              subtitle: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(data.content,
                          maxLines: 2, overflow: TextOverflow.ellipsis)),
                  Flexible(
                      child: Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        data.dateTime,
                        style: TextStyle(fontSize: 13, color: Colors.black38),
                      ),
                    ),
                  ))
                ],
              )),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsNotification(notification: data)));
        });
  }
}
