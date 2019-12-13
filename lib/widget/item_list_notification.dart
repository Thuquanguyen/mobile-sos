import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/notification.dart' as notification;

class ItemListNotification extends StatelessWidget {
  final notification.Notification data;

  const ItemListNotification({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: ListTile(
        title: Text(data.title),
        subtitle: Text(data.content,maxLines: 3,overflow: TextOverflow.ellipsis)
      ),
    );
  }
}
