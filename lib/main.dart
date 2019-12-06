import 'package:flutter/material.dart';
import 'package:hello_wolrd/screen/details/widget_details_station.dart';
import 'package:hello_wolrd/screen/details/widget_details_about.dart';
import 'package:hello_wolrd/screen/main/widget_main.dart';
import 'package:provider/provider.dart';

import 'model/Station.dart';

void main() => runApp(MainView());

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Station())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.deepOrange
        ),
        home:  WidgetGoogleMap(),
        routes: {
          DetailsAbout.routerName : (context) => DetailsAbout(),
          WidgetGoogleMap.routerName : (context) => WidgetGoogleMap(),
          DetailsStation.routerName : (context) => DetailsStation(),
        },
      ),
    );
  }
}