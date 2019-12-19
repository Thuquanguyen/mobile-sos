import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:google_map_location_picker/generated/i18n.dart'
    as location_picker;
import 'package:google_map_location_picker/generated/i18n.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hello_wolrd/screen/address/widget_datetime.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  LocationResult _pickedLocation;
  final _controllerAddress = TextEditingController();
  var _controllerName = TextEditingController();
  var _controllerPhone = TextEditingController();
  var _controllerEmail = TextEditingController();
  var _controllerDescription = TextEditingController();
  var arrTitle = [
    "Name Address",
    "Address",
    "Phone Number",
    "Email",
    "Description"
  ];
  var arrImagePre = [
    Icons.location_city,
    Icons.filter_center_focus,
    Icons.phone_in_talk,
    Icons.email,
    Icons.description
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'location picker',
      localizationsDelegates: const [
        location_picker.S.delegate,
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('vi', ''),
      ],
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: NestedScrollView(
              headerSliverBuilder: (mContext, inner) {
                return <Widget>[
                  SliverAppBar(
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    expandedHeight: MediaQuery.of(context).size.height / 4,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("Add Address"),
                      background: Image.asset(
                        "assets/images/city.jpg",
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  )
                ];
              },
              body: SingleChildScrollView(
                child: Container(
                  color: Color.fromRGBO(246, 246, 246, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            child: TextField(
                          controller: _controllerName,
                          decoration: InputDecoration(
                              hintText: 'Name Address',
                              labelText: 'Name Address',
                              prefixIcon: Icon(
                                Icons.location_city,
                                color: Colors.blue,
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 17,
                                    color: Colors.teal,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _controllerName.text = "";
                                    });
                                  }),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black12))),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            child: TextField(
                          keyboardType: TextInputType.multiline,
                          controller: _controllerAddress,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: 'Address',
                              labelText: 'Address',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.filter_center_focus),
                                color: Colors.blue,
                                onPressed: () async {
                                  LocationResult result =
                                      await LocationPicker.pickLocation(
                                    context,
                                    "AIzaSyCxhNje85NaUiBJjy2VPU5iHgwh1snxWyE",
                                  );
                                  setState(() {
                                    _controllerAddress.text =
                                        _pickedLocation.toString();
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black12))),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            child: TextField(
                          controller: _controllerPhone,
                          decoration: InputDecoration(
                              hintText: 'Phone Number',
                              labelText: 'Phone Number',
                              prefixIcon: Icon(
                                Icons.phone_in_talk,
                                color: Colors.blue,
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 17,
                                    color: Colors.teal,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _controllerPhone.text = "";
                                    });
                                  }),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black12))),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            child: TextField(
                          controller: _controllerEmail,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              labelText: 'Email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 17,
                                    color: Colors.teal,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _controllerEmail.text = "";
                                    });
                                  }),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black12))),
                        )),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: MultiSelect(
                            autovalidate: false,
                            titleText: "Supporter More",
                            // ignore: missing_return
                            validator: (value) {
                              if (value == null) {
                                return 'Please select one or more option(s)';
                              }
                            },
                            errorText: 'Please select one or more option(s)',
                            dataSource: [
                              {
                                "display": "Motorbike",
                                "value": 1,
                              },
                              {
                                "display": "Car",
                                "value": 2,
                              },
                              {
                                "display": "Bike",
                                "value": 3,
                              },
                              {
                                "display": "Ships",
                                "value": 4,
                              },
                              {
                                "display": "Other...",
                                "value": 5,
                              }
                            ],
                            textField: 'display',
                            valueField: 'value',
                            filterable: false,
                            required: true,
                            value: null,
                            change: (value) {
                              print("vao day $value");
                            },
                          )),
                      WidgetDatetime(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            child: TextField(
                          controller: _controllerDescription,
                          keyboardType: TextInputType.multiline,
//                      controller: _controllerAddress,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: 'Description',
                              labelText: 'Description',
                              prefixIcon: Icon(
                                Icons.description,
                                color: Colors.blue,
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 17,
                                    color: Colors.teal,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _controllerDescription.text = "";
                                    });
                                  }),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black12))),
                        )),
                      ),
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {},
                              child: Text(
                                "Add Address",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width)
                    ],
                  ),
                ),
              ))),
    );
  }
}

