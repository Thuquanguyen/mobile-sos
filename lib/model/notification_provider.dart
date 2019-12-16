import 'package:flutter/foundation.dart';
import 'package:hello_wolrd/database/notification_helpers.dart';
import 'package:hello_wolrd/model/notification_item.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationItem> _items = [];
  List<NotificationItem> _itemSearch = [];
  bool _isSearch = false;


  List<NotificationItem> get items {
    return [..._items];
  }

  List<NotificationItem> get itemSearch {
    return [..._itemSearch];
  }

  bool get isSearch {
    return _isSearch;
  }


  // ignore: missing_return
  List<NotificationItem> findNameNotification(String title) {
    _itemSearch = title != ""
        ? _items
            .where((notification) =>
                notification.title.toLowerCase().contains(title.toLowerCase()))
            .toList()
        : _items;
    notifyListeners();
  }

  Future<void> getAllNotificaiton() async {
    NotificationHelper notificationHelper = NotificationHelper.instance;
    List<NotificationItem> notification = [];
    List<NotificationItem> notificationItem =
        await notificationHelper.queryAllNotificaiton();
    notificationItem = await notificationHelper.queryAllNotificaiton();
    if (notificationItem == null) {
      return;
    } else {
      notificationItem.forEach((data) {
        notification.add(NotificationItem(
            id: data.id,
            title: data.title,
            content: data.content,
            dateTime: data.dateTime,
            status: data.status));
      });
    }
    _items = notification.reversed.toList();
    _itemSearch = _items;
    notifyListeners();
  }



  Future<void> addNotificaiton(String title, String content) async {
    NotificationHelper _notificationHelper = NotificationHelper.instance;
    _notificationHelper.insert(NotificationItem(
        title: title,
        content: content,
        dateTime: DateTime.now().toString(),
        status: 0));
    getAllNotificaiton();
    notifyListeners();
  }

  Future<void> deleteNotificaiton(int id) async {
    NotificationHelper _notificationHelper = NotificationHelper.instance;
    _notificationHelper.deleteNotificaiton(id);
    getAllNotificaiton();
    notifyListeners();
  }
}
