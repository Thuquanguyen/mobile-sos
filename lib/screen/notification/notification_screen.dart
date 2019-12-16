import 'package:flutter/material.dart';
import 'package:hello_wolrd/data/TabBarData.dart';
import 'package:hello_wolrd/data/TabBarWidget.dart';
import 'package:hello_wolrd/model/choice_item.dart';
import 'package:hello_wolrd/model/tab_widget.dart';
import 'package:hello_wolrd/widget/item_list_tabbar.dart';

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
                        widget_search(_controller,tabWidget.index),
                        Flexible(child: ItemListTabBar(tabWidget: tabWidget))
                      ],
                    ));
              }).toList()))),
    );
  }
}

Widget widget_search(TextEditingController _controller, int index) =>
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: TextFormField(
        controller: _controller,
        onChanged: (value) {},
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 17),
          hintText: index == 0
              ? 'Tìm kiếm trạm'
              : 'Tìm kiếm sự kiện',
          suffixIcon: IconButton(
            icon: Icon(
              Icons.cancel,
              size: 20,
            ),
            onPressed: () {},
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(14),
        ),
      ),
    );
