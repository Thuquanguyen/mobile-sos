import 'package:flutter/material.dart';
import 'package:hello_wolrd/data/TabBarData.dart';
import 'package:hello_wolrd/data/TabBarWidget.dart';
import 'package:hello_wolrd/model/choice_item.dart';
import 'package:hello_wolrd/model/notification_provider.dart';
import 'package:hello_wolrd/model/tab_widget.dart';
import 'package:hello_wolrd/widget/item_list_tabbar.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationSearch();
  }
}

class NotificationSearch extends StatefulWidget {
  @override
  _NotificationSearchState createState() => _NotificationSearchState();
}

class _NotificationSearchState extends State<NotificationSearch> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: TabBarData.choices.length,
          child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                    isScrollable: true,
                    tabs: TabBarData.choices.map((Choice choice) {
                      return SafeArea(
                          child: Container(
                              child: Tab(
                                  text: choice.title, icon: Icon(choice.icon)),
                              width: MediaQuery.of(context).size.width / 2));
                    }).toList(),
                    onTap: (index) {
                      print("index = $index");
                    }),
              ),
              body: TabBarView(
                  children: TabBarWidget.widgets.map((TabWidget tabWidget) {
                return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Flexible(child: ItemListTabBar(tabWidget: tabWidget))
                      ],
                    ));
              }).toList()))),
    );
  }
}
