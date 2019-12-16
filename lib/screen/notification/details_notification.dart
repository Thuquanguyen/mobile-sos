import 'package:flutter/material.dart';
import 'package:hello_wolrd/database/notification_helpers.dart';
import 'package:hello_wolrd/model/notification_item.dart';
import 'package:hello_wolrd/model/notification_provider.dart';
import 'package:provider/provider.dart';

class DetailsNotification extends StatelessWidget {
  final NotificationItem notification;

  const DetailsNotification({Key key, this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailsView(notification: notification);
  }
}

class DetailsView extends StatefulWidget {
  final NotificationItem notification;

  const DetailsView({Key key, this.notification}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    updateNotification(widget.notification);
  }

  Future<void> updateNotification(NotificationItem notificationItem) async {
    NotificationHelper _notificationHelper = NotificationHelper.instance;
    _notificationHelper.updateNotification(NotificationItem(
        id: notificationItem.id,
        title: notificationItem.title,
        content: notificationItem.content,
        dateTime: notificationItem.dateTime,
        status: notificationItem.status == 0 ? 1 : 1));
  }

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
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: Text(widget.notification.dateTime))),
              Flexible(
                  child: ListTile(
                title: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      widget.notification.title,
                      style: TextStyle(fontSize: 18),
                    )),
                subtitle: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Text(widget.notification.content,
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
