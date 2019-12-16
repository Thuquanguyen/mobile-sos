import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/choice_item.dart';

class TabBarData {
  static const List<Choice> choices = const <Choice>[
    const Choice(title: 'Notification', icon: Icons.notifications_active),
    const Choice(title: 'Events', icon: Icons.event),
  ];
}
