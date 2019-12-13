
import 'package:hello_wolrd/model/tab_widget.dart';
import 'package:hello_wolrd/screen/notification/list_event.dart';
import 'package:hello_wolrd/screen/notification/list_notification.dart';

class TabBarWidget {
  static  List<TabWidget> widgets = <TabWidget>[
     TabWidget(widget: ListNotification(),index: 0),
     TabWidget(widget: ListEvent(),index: 1),
  ];
}
