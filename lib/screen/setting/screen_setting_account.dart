import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSettingAccount extends StatelessWidget {
  static final pageRouter = '/account';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final _controllerName = TextEditingController(text: "Nguyen Quang Thu");
    final _controllerEmail =
        TextEditingController(text: "quangthu1162@gmail.com");
    final _controllerMobile = TextEditingController(text: "+84 0969551162");
    final _controllerAddress = TextEditingController(text: "No.2 Duy Tan,Cau Giay,Ha Noi");
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Column(
              children: <Widget>[
                custom_header(width, height, context),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text('Full name',
                                    style: TextStyle(color: Colors.black38)),
                                subtitle: TextFormField(
                                  controller: _controllerName,
                                ),
                              ),
                              ListTile(
                                title: Text('Email',
                                    style: TextStyle(color: Colors.black38)),
                                subtitle: TextFormField(
                                  controller: _controllerEmail,
                                ),
                              ),
                              ListTile(
                                title: Text('Mobile',
                                    style: TextStyle(color: Colors.black38)),
                                subtitle: TextFormField(
                                  controller: _controllerMobile,
                                ),
                              ),
                              ListTile(
                                title: Text('Address',
                                    style: TextStyle(color: Colors.black38)),
                                subtitle: TextFormField(
                                  controller: _controllerAddress,
                                ),
                              ),
                              Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: RaisedButton(
                                        color: Colors.black,
                                        onPressed: () {},
                                        child: Text(
                                          'Update Profile',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                  width: width)
                            ],
                          ),
                        )),
                  ),
                )
              ],
            ))));
  }
}

Widget custom_header(double width, double height, BuildContext context) =>
    Stack(
      children: <Widget>[
        Container(
          width: width,
          height: height * 0.2,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Colors.white, size: 18),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
              ),
              Padding(
                padding: EdgeInsets.only(top: width / 15, left: width / 20),
                child: ListTile(
                  title: Text("Nguyen Quang Thu",
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text('quangthu1162@gmail.com',
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.teal],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(width))),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: EdgeInsets.only(top: height * 0.09),
                child: Stack(
                  children: <Widget>[
                    ClipOval(
                        child: Image.asset('assets/images/image_profile.jpg',
                            width: 100, height: 100)),
                    Positioned(
                      child: ClipOval(
                          child: Container(
                              width: 30,
                              height: 30,
                              child: Center(
                                child: IconButton(
                                    icon: Icon(
                                      Icons.add_a_photo,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {}),
                              ),
                              color: Colors.blue)),
                      bottom: 0,
                      right: 5,
                    )
                  ],
                ))),
      ],
    );
