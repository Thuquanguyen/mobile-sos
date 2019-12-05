import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/StationItem.dart';
import 'package:hello_wolrd/widget/item/item_list_search.dart';

class SearchList extends StatelessWidget {
  final List<StationItem> list;

  const SearchList({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder:(context, index) {
        return Container(
          child: ItemSearch(name: list[index].name,address: list[index].address),
          decoration: BoxDecoration(
              color: index % 2 == 0 ? Colors.white : Color.fromRGBO(248, 248, 248, 1)),
        );
      },
      itemCount: list.length,
    );
  }
}
