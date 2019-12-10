import 'package:flutter/material.dart';

class DetailsAbout extends StatelessWidget {
  static const routeName = '/abouts';
  final String about;

  const DetailsAbout({Key key, this.about}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('About'),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Text('$about'),
        ),
      ),
    );
  }
}
