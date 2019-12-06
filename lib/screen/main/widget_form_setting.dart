import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class FormSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
            margin: const EdgeInsets.only(right: 10),
            height: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: FlutterSlider(
              axis: Axis.vertical,
              values: [0, 60],
              fixedValues: [
                FlutterSliderFixedValue(percent: 0, value: "0"),
                FlutterSliderFixedValue(percent: 10, value: "10"),
                FlutterSliderFixedValue(percent: 20, value: "20"),
                FlutterSliderFixedValue(percent: 30, value: "30"),
                FlutterSliderFixedValue(percent: 40, value: "40"),
                FlutterSliderFixedValue(percent: 50, value: "50")
              ],
              min: 0,
              max: 50,
              rtl: true,
              step: 50,
              jump: true,
            )));
  }
}
