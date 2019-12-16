import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hello_wolrd/model/notification_item.dart';

class ListEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MessaginWidget();
  }
}

class MessaginWidget extends StatefulWidget {
  @override
  _MessaginWidgetState createState() => _MessaginWidgetState();
}

class _MessaginWidgetState extends State<MessaginWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  List<NotificationItem> notification = [];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
      final notificaiton1 = message['notification'];
      setState(() {
        notification.add(NotificationItem(
            title: notificaiton1['title'], content: notificaiton1['body']));
      });
    }, onLaunch: (Map<String, dynamic> message) async {
      setState(() {
        notification.add(NotificationItem(
            title: '$message', content: 'Onlaunch'));
      });
      final notificaiton1 = message['data'];
      setState(() {
        notification.add(NotificationItem(
            title: 'OnLaunch ${notificaiton1['title']}',
            content: 'Onlaunch ${notificaiton1['body']}'));
      });
    }, onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    });
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      child: ListView(children: notification.map(buildMessage).toList()),
    ));
  }

  Widget buildMessage(NotificationItem notification) => ListTile(
        title: Text(notification.title),
        subtitle: Text(notification.content,
            maxLines: 3, overflow: TextOverflow.ellipsis),
      );
}
