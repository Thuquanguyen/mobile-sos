import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/question.dart';
import 'package:hello_wolrd/screen/details/widget_details_station.dart';
import 'package:hello_wolrd/screen/details/widget_details_about.dart';
import 'package:hello_wolrd/screen/favorites/screen_favorite.dart';
import 'package:hello_wolrd/screen/main/widget_main.dart';
import 'package:hello_wolrd/screen/menu/screen_menu.dart';
import 'package:hello_wolrd/screen/navigation/fab_bottom_app_bar.dart';
import 'package:hello_wolrd/screen/question/screen_question.dart';
import 'package:hello_wolrd/screen/setting/screen_setting.dart';
import 'package:provider/provider.dart';

import 'model/station.dart';

void main() => runApp(MainView());

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Main();
  }
}

class Main extends StatefulWidget {
  final String title;

  const Main({Key key, this.title}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Widget _lastSelected;

  void _selectedTab(int index) {
    setState(() {
      switch (index) {
        case 0:
          _lastSelected = MenuScreen();
          break;
        case 1:
          _lastSelected = FavoriteScreen();
          break;
        case 2:
          _lastSelected = SettingScreen();
          break;
        case 3:
          _lastSelected = QuestionScreen();
          break;
        default:
          _lastSelected = WidgetGoogleMap();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Station()),
        ChangeNotifierProvider.value(value: Question())
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.purple, accentColor: Colors.deepOrange),
        home: Scaffold(
            body: _lastSelected == null ? WidgetGoogleMap() : _lastSelected,
            bottomNavigationBar: FABBottomAppBar(
              centerItemText: 'Home',
              color: Colors.blueGrey,
              selectedColor: Colors.red,
              notchedShape: CircularNotchedRectangle(),
              onTabSelected: _selectedTab,
              items: [
                FABBottomAppBarItem(iconData: Icons.menu, text: 'Menu'),
                FABBottomAppBarItem(
                    iconData: Icons.bookmark, text: 'Favorites'),
                FABBottomAppBarItem(iconData: Icons.settings, text: 'Setting'),
                FABBottomAppBarItem(
                    iconData: Icons.question_answer, text: 'Question'),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              elevation: 2.0,
              onPressed: () {
                _selectedTab(-1);
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.home, color: Colors.white),
            )),
        routes: {
          WidgetGoogleMap.routerName: (_) => WidgetGoogleMap(),
          DetailsStation.routerName: (_) => DetailsStation(),
          DetailsAbout.routeName: (_) => DetailsAbout(),
        },
      ),
    );
  }
}
