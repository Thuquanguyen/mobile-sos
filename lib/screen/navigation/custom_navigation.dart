import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
          color: Colors.blue,
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.blue),
          )),
      child: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[],
        ),
        color: Colors.blue,
      ),
    );
  }
}
