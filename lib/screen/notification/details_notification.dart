import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/notification_item.dart';

class DetailsNotification extends StatelessWidget {
  final NotificationItem notification;

  const DetailsNotification({Key key, this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10,left: 15),
                      child: Text(notification.dateTime))),
              Flexible(
                  child: ListTile(
                title: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      notification.title,
                      style: TextStyle(fontSize: 18),
                    )),
                subtitle: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Text(notification.content,
                      style: TextStyle(fontSize: 16, wordSpacing: 0.5)),
                )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
