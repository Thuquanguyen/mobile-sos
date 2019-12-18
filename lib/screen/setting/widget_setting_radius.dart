import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:hello_wolrd/referent/referent_setting.dart';

class SettingRadius extends StatefulWidget {
  @override
  _SettingRadiusState createState() => _SettingRadiusState();
}

class _SettingRadiusState extends State<SettingRadius> {
  double radius = 0;
  ReferentSetting referentSetting = ReferentSetting();

  @override
  void initState() {
    super.initState();
    referentSetting.getRadius().then((radius) {
      if (radius != null) {
          this.radius = radius;
      } else {
        this.radius = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 15, bottom: 10, right: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Text("Radius")),
                Text("$radius Km")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                    child: FlutterSlider(
                  values: [radius],
                  max: 50,
                  min: 0,
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    setState(() {
                      radius = lowerValue;
                    });
                  },
                  onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                    referentSetting.setRadius(lowerValue);
                  },
                )),
              ],
            )
          ],
        ));
  }
}
