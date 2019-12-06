import 'package:flutter/material.dart';

class ItemSearch extends StatelessWidget {
  final String name;
  final String address;

  const ItemSearch({Key key, this.name, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: ListTile(
                title: Text(name,
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                subtitle: Text(address)),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.arrow_forward_ios, color: Colors.blue),
            ),
          )
        ],
      ),
      margin: const EdgeInsets.only(top: 5, bottom: 5),
    );
  }
}
