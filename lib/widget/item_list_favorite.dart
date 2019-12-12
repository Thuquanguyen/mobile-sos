import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/sqlite_station.dart';

class ItemListFavorite extends StatelessWidget {
  final DatabaseStation databaseStation;
  final index;
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  ItemListFavorite({Key key, this.databaseStation, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: index % 2 == 0 ? Colors.cyanAccent : Colors.white,
        ),
        width: double.infinity,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 0, color: secondary),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  databaseStation.items[index].name,
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                        child: Text(
                      databaseStation.items[index].address,
                      style: TextStyle(
                          color: primary,
                          fontSize: 13,
                          letterSpacing: .3,
                          wordSpacing: 2),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                    )),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.school,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text("fdfdsfdsfs",
                          style: TextStyle(
                              color: primary, fontSize: 13, letterSpacing: .3),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true),
                    )
                  ],
                ),
              ],
            )),
            new Container(
              child: Center(
                  child: IconButton(
                      icon: Icon(
                        Icons.bookmark,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        databaseStation
                            .removeItemStation(databaseStation.items[index].id);
                        databaseStation.readDatabase();
                      })),
            ),
          ],
        ),
      ),
      onTap: () {
        print("id : ${databaseStation.items[index].id}");
      },
    );
  }
}
