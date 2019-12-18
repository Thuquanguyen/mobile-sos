import 'package:flutter/material.dart';
import 'package:hello_wolrd/referent/referent_setting.dart';

class SettingPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhoneView();
  }
}

class PhoneView extends StatefulWidget {
  @override
  _PhoneViewState createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  var isEdit = false;
  var _controller = TextEditingController();
  ReferentSetting referentSetting = ReferentSetting();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    referentSetting.getPhone().then((phone) {
      if (phone != null) {
        _controller.text = phone;
      } else {
        _controller.text = "0969551162";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text("Emergency telephone number"),
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 15), child: Text("+84")),
            Expanded(
                child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: _controller,
              enabled: isEdit,
              autofocus: isEdit,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 17),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14,right: 14,bottom: 14,left: 5),
              ),
            )),
            IconButton(
              icon: Icon(
                !isEdit ? Icons.edit : Icons.save,
                size: 20,
                color: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  isEdit = !isEdit;
                });
                referentSetting.setPhone(_controller.text);
              },
            )
          ],
        )
      ],
    );
  }
}
