import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_wolrd/screen/setting/screen_setting_account.dart';

class SettingAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Icon(Icons.account_circle, color: Colors.blue),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Account", style: TextStyle(color: Colors.blue)),
            )),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.blue,
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ScreenSettingAccount()));
      },
    );
  }
}
