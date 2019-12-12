import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/station.dart';
import 'package:hello_wolrd/model/station_item.dart';
import 'package:hello_wolrd/screen/details/widget_details_about.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

var arrTitle = [
  "Location",
  "Phone",
  "Email",
  "Website",
  "Confirm Location",
  "About",
  "Joined Date"
];
var arrIconData = [
  Icons.location_city,
  Icons.perm_phone_msg,
  Icons.email,
  Icons.web,
  Icons.bookmark,
  Icons.forum,
  Icons.update
];

// ignore: must_be_immutable
class DetailsStation extends StatelessWidget {
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final stationId = ModalRoute.of(context).settings.arguments as int;
    StationItem stationItem = Provider.of<Station>(context).findById(stationId);
    return MaterialApp(
      home: Scaffold(
        body: _details(context, stationItem),
      ),
    );
  }
}

Widget _details(BuildContext context, StationItem stationItem) => Container(
      height: MediaQuery.of(context).size.height,
      color: Color.fromRGBO(229, 229, 232, 1),
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _widgetImage(stationItem.id),
                  _widgetContentTitle(context, stationItem),
                  _widgetImageTitle(context),
                ],
              ),
              _content(context, stationItem)
            ],
          )),
          _buttonBack(context)
        ],
      ),
    );
//Hiển thị nội dung trạm
Widget _content(BuildContext context, StationItem stationItem) => Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text("Station Infomation",
                          style: TextStyle(fontSize: 18))),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child: SmoothStarRating(
                      allowHalfRating: false,
                      starCount: 5,
                      rating: stationItem.rate,
                      size: 30,
                      color: Colors.green,
                      spacing: 0.0,
                      borderColor: Colors.green,
                    ),
                  ))
                ],
              )),
          Container(height: 2, color: Color.fromRGBO(183, 183, 186, 0.7)),
          Expanded(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _customItemList(
                        context,
                        index,
                        [
                          stationItem.address,
                          "+84-${stationItem.phoneNumber[0]}",
                          stationItem.email,
                          stationItem.website,
                          "",
                          stationItem.about,
                          stationItem.openAndCloseTime
                        ],
                        index == 1 ? true : false,
                        index == 4 ? true : false,
                        index == 1 || index == 4 ? true : false,
                        index != 4 ? true : false);
                  },
                  itemCount: arrTitle.length))
        ],
      ),
    );
//custom item list
Widget _customItemList(BuildContext context, int index, List<String> arrContent,
        bool vbPhone, bool vbConfirm, bool isButton, bool isTitle) =>
    Container(
        child: Row(
      children: <Widget>[
        Icon(arrIconData[index], color: Color.fromRGBO(149, 158, 151, 1)),
        Expanded(
          child: vbConfirm
              ? Container(
                  child: Text(
                    arrTitle[index],
                    style: TextStyle(fontSize: 17),
                  ),
                  margin: const EdgeInsets.only(left: 15),
                )
              : ListTile(
                  title: Text(arrTitle[index], style: TextStyle(fontSize: 17)),
                  subtitle: Visibility(
                      child: index == 5
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Flexible(
                                    flex: 2,
                                    child:
                                        Text(arrContent[index], maxLines: 2)),
                                GestureDetector(
                                  child: Text("...more",
                                      style: TextStyle(color: Colors.blue)),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                        new DetailsAbout(about: arrContent[index])));
                                  },
                                )
                              ],
                            )
                          : Text(arrContent[index],
                              maxLines: 3, overflow: TextOverflow.ellipsis),
                      visible: isTitle),
                ),
        ),
        Visibility(
            child: vbPhone
                ? RaisedButton(
                    color: Color.fromRGBO(149, 158, 151, 1),
                    onPressed: () {
                      UrlLauncher.launch("tel://${arrContent[index]}");
                    },
                    child:
                        Text("Call Now", style: TextStyle(color: Colors.white)))
                : Icon(
                    Icons.beenhere,
                    color: Colors.blue,
                  ),
            visible: isButton)
      ],
    ));
//Hiển thị nội dung trong title
Widget _widgetContentTitle(BuildContext context, StationItem stationItem) =>
    Container(
      height: 155,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 200),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 3.5, top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  stationItem.name,
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  child: Text(
                    "Mon-Fri",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  stationItem.openAndCloseTime,
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(74, 74, 74, 1)),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: _itemBottom(Icons.bookmark, "Favorite"),
                  ),
                  Expanded(
                    child: _itemBottom(Icons.share, "Share"),
                  ),
                  Expanded(
                    child: _itemBottom(Icons.directions, "Direction"),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );

Widget _itemBottom(IconData icon, String text) => Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue,
          ),
          Text(text, style: TextStyle(fontSize: 15))
        ],
      ),
    );
//Hiển thị nút back
Widget _buttonBack(BuildContext context) => Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.width / 11,
          left: MediaQuery.of(context).size.width / 30),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
//Hiển thị ảnh background
Widget _widgetImage(int id) => Hero(
    tag: "hero$id",
    child: Image.network(
        "https://lh3.googleusercontent.com/ZxUGcGmOFAork_vATfZ7PgJmVP0p_KY3VsceRhBHZ1Jwr9SRWdtMjZjrEXytO21eysOxm0Eu=w1080-h608-p-no-v0"));
//Hiển thị ảnh title
Widget _widgetImageTitle(BuildContext context) => Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 12,
          top: MediaQuery.of(context).size.width / 2.2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            child: Align(
          alignment: Alignment.center,
          widthFactor: 0.75,
          heightFactor: 0.75,
          child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm0uXIKytEk5RWZAlfVr3SSuWgnXChMrHQc18U7CdBrhmN3QgVbg&s",
            width: 120,
            height: 100,
          ),
        )),
      ),
    );
