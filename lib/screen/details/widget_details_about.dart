import 'package:flutter/material.dart';


class DetailsAbout extends StatelessWidget {
  static const routerName = '/abouts';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('About'),
          centerTitle: true,
        ),
        body: Center(child: Text("Center")),
      ),
    );
  }
}
