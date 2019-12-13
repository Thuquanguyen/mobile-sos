import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/tab_widget.dart';

class ItemListTabBar extends StatelessWidget {
  final TabWidget tabWidget;

  const ItemListTabBar({Key key, this.tabWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[tabWidget.widget],
        ),
      ),
    );
  }
}
