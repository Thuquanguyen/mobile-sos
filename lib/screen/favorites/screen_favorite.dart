import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_wolrd/inherited/FavoriteInheritedWidget.dart';
import 'package:hello_wolrd/model/sqlite_station.dart';
import 'package:hello_wolrd/screen/favorites/widget_listview_favorite.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FavoriteView(),
    );
  }
}

class FavoriteView extends StatefulWidget {
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteView> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: FutureBuilder(
          future: Provider.of<DatabaseStation>(context,listen: false).readDatabase(),
          builder: (context, data) {
            if (data.connectionState == ConnectionState.waiting) {
              return Center(child: CupertinoActivityIndicator());
            } else if (data.error != null) {
              return Center(child: Text("An error!"));
            } else {
              return Consumer<DatabaseStation>(
                  builder: (context, data, child) => SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: <Widget>[
                              FavoriteInheritedWidget(
                                  databaseStation: data, child: ListFavorite()),
                              Container(
                                height: 120,
                                width: double.infinity,
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      new Container(
                                        margin: const EdgeInsets.only(
                                            top: 53.0, left: 10.0, right: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 30.0),
                                                  padding: const EdgeInsets.all(
                                                      14.0),
                                                  child: new TextField(
                                                      autofocus: false,
                                                      style: TextStyle(
                                                          fontSize: 16.0),
                                                      decoration:
                                                          new InputDecoration
                                                                  .collapsed(
                                                              hintText:
                                                                  "Search Station"))),
                                            ),
                                            new Container(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: new Icon(Icons.search),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
            }
          }),
    );
  }
}
