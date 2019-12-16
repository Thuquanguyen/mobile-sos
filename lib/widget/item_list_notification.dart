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
          color: data.status?Colors.white:Colors.black12,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: ListTile(
              title: Text(data.title),
              subtitle: Column(
                children: <Widget>[
                  Text(data.content,
                      maxLines: 3, overflow: TextOverflow.ellipsis),
                  Flexible(child: Container(
                    padding: const EdgeInsets.only(right: 10,bottom: 10),
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
