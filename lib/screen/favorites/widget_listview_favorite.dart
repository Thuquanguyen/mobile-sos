import 'package:flutter/material.dart';
import 'package:hello_wolrd/inherited/FavoriteInheritedWidget.dart';
import 'package:hello_wolrd/widget/item_list_favorite.dart';

class ListFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favorite = FavoriteInheritedWidget.of(context);
    return Container(
      padding: EdgeInsets.only(top: 85),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: favorite.databaseStation.items.length == 0
          ? Center(child: Text("No Station Favorite"))
          : ListView.builder(
              itemCount: favorite.databaseStation.items.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemListFavorite(
                    databaseStation: favorite.databaseStation, index: index);
              }),
    );
  }
}
