import 'package:flutter/material.dart';

class DetailsStation extends StatelessWidget {
  static const routerName = '/details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(229, 229, 232, 1),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Hero(
                          tag: "hero0",
                          child: Image.network(
                              "https://lh3.googleusercontent.com/ZxUGcGmOFAork_vATfZ7PgJmVP0p_KY3VsceRhBHZ1Jwr9SRWdtMjZjrEXytO21eysOxm0Eu=w1080-h608-p-no-v0")),
                      Container(
                        height: 200,
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, top: 200),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text("jajaa"),
                        ),
                      )
                    ],
                  ),
                ],
              )),
              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10,top: MediaQuery.of(context).size.width / 2.3),
                child: ClipRect(
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm0uXIKytEk5RWZAlfVr3SSuWgnXChMrHQc18U7CdBrhmN3QgVbg&s",
                    width: 74,
                    height: 66,
                  ),
                  clipBehavior: Clip.hardEdge,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 11,
                    left: MediaQuery.of(context).size.width / 30),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
