import 'package:flutter/material.dart';
import 'package:hello_wolrd/screen/menu/list_menu.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
          body: Container(
        margin: EdgeInsets.only(left: width / 30, top: 80,right: width/30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Menu", style: TextStyle(fontSize: 20, color: Colors.blue)),
            Container(margin: EdgeInsets.only(top: 10),child: SizedBox(height: 2,width: width,),color: Colors.blue,),
            ListMenu()
          ],
        ),
      )),
    );
  }
}
