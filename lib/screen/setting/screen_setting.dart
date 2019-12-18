import 'package:flutter/material.dart';
import 'package:hello_wolrd/screen/setting/widget_setting_account.dart';
import 'package:hello_wolrd/screen/setting/widget_setting_phone.dart';
import 'package:hello_wolrd/screen/setting/widget_setting_radius.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(left: width / 30, top: 80, right: width / 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(Icons.settings,
                              color: Colors.blue, size: 20)),
                      Text("Setting",
                          style: TextStyle(fontSize: 20, color: Colors.blue))
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      child: SizedBox(
                        height: 2,
                        width: width,
                      ),
                      color: Colors.blue),
                  Card(child: SettingAccount()),
                  Card(child: SettingPhone()),
                  Card(child: SettingRadius())
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
