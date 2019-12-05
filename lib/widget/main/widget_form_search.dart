import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/Station.dart';
import 'package:hello_wolrd/model/StationItem.dart';
import 'package:hello_wolrd/widget/main/widget_list_search.dart';

class FormSearch extends StatelessWidget {
  final Station data;

  const FormSearch({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
      child: Wrap(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Tìm kiếm trạm',
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14),
                  ),
                ),
              ),
              Visibility(
                  visible: false,
                  child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: SearchList(list: data.itemStation),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
