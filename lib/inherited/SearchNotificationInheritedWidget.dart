import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/notification_item.dart';
import 'package:hello_wolrd/model/station_item.dart';

class SearchNotificationInheritedWidget extends InheritedWidget {
  final List<NotificationItem> notificationItem;

  const SearchNotificationInheritedWidget({
    Key key,
    @required this.notificationItem,
    @required Widget child,
  }) : super(key: key, child: child);

  static SearchNotificationInheritedWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(SearchNotificationInheritedWidget);
  }
  @override
  bool updateShouldNotify(SearchNotificationInheritedWidget oldWidget) {
    return notificationItem != oldWidget.notificationItem;
  }
}
