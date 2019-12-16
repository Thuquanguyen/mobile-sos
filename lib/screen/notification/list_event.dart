import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/notification_item.dart';
import 'package:hello_wolrd/model/notification_provider.dart';
import 'package:hello_wolrd/widget/item_list_notification.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EventView();
  }
}

class EventView extends StatefulWidget {
  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  List<NotificationItem> data = [];
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          final notificationData = message['event'];
          Provider.of<NotificationProvider>(context, listen: false)
              .addNotificaiton(
              notificationData['title'], notificationData['body']);
        },
        onLaunch: (Map<String, dynamic> message) async {},
        onResume: (Map<String, dynamic> message) async {});
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<NotificationProvider>(context, listen: false)
            .getAllNotificaiton(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator());
          } else if (data.error != null) {
            return Center(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('An error! ${data.error}')));
          }
          return Consumer<NotificationProvider>(
              builder: (context, data, child) => Flexible(
                  child: data.items.length == 0
                      ? Center(child: Text("None Notification!"))
                      : Column(
                    children: <Widget>[
                      widget_search(_controller,context),
                      Flexible(
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                  itemExtent: 100.0,
                                  itemBuilder: (context, index) {
                                    return Dismissible(
                                      background: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 10),
                                              child: Text('DELETE',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color:
                                                      Colors.red))),
                                        ),
                                      ),
                                      key: Key(
                                          "${data.itemSearch[index].id}"),
                                      child: Container(
                                          child: ItemListNotification(
                                              data:
                                              data.itemSearch[index]),
                                          color: index % 2 == 0
                                              ? Colors.white30
                                              : Colors.white),
                                      direction:
                                      DismissDirection.startToEnd,
                                      onDismissed: (result) {
                                        data.deleteNotificaiton(
                                            data.itemSearch[index].id);
                                      },
                                    );
                                  },
                                  itemCount: data.itemSearch.length)))
                    ],
                  )));
        });
  }

  Widget widget_search(TextEditingController _controller,BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: TextFormField(
      controller: _controller,
      onChanged: (value) {
        Provider.of<NotificationProvider>(context)
            .findNameNotification(value);
      },
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 17),
        hintText: 'Tìm kiếm sự kiện',
        suffixIcon: IconButton(
          icon: Icon(
            Icons.cancel,
            size: 20,
          ),
          onPressed: () {
            _controller.text= "";
            Provider.of<NotificationProvider>(context).findNameNotification("");
          },
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(14),
      ),
    ),
  );
}
