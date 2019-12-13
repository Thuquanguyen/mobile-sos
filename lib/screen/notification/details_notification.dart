import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/notification.dart' as noti;

class DetailsNotification extends StatelessWidget {
  final noti.Notification notification;

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
          ),
        ),
      ),
    );
  }
}
