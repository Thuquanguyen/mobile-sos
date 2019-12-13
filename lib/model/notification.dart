import 'package:flutter/cupertino.dart';

class Notification {
  final String title;
  final String content;
  final String dateTime;

  Notification(
      {@required this.title, @required this.content, @required this.dateTime});
}
