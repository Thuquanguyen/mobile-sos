import 'package:flutter/cupertino.dart';

class NotificationItem {
  final int id;
  final String title;
  final String content;
  final String dateTime;
  final int status;

  NotificationItem(
      {@required this.id,@required this.title, @required this.content, @required this.dateTime,@required this.status});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'content': this.content,
      'dateTime': this.dateTime,
      'status': this.status,
    };
  }

  factory NotificationItem.fromMap(Map<String, dynamic> map) {
    return new NotificationItem(
      id: map['id'] as int,
      title: map['title'] as String,
      content: map['content'] as String,
      dateTime: map['dateTime'] as String,
      status: map['status'] as int,
    );
  }
}