import 'package:flutter/foundation.dart';
import 'package:hello_wolrd/model/notification_item.dart';

class NotificationProvider extends ChangeNotifier {
  final List<NotificationItem> _items = [];

  List<NotificationItem> get items{
  return [..._items];
  }
  Future<void> getAllNotificaiton() async{

  }
}