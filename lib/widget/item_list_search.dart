import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/station.dart';
import 'package:provider/provider.dart';

class ItemSearch extends StatelessWidget {
  final String name;
  final String address;
  final String id;

  const ItemSearch({Key key, this.name, this.address, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
      ),
      onTap: () {
        Provider.of<Station>(context).findByStationId(id);
      },
    );
  }
}
