import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/station_item.dart';

class SearchInheritedWidget extends InheritedWidget {
  final List<StationItem> stationItem;
  final String name;

  const SearchInheritedWidget({
    Key key,
    @required this.name,
    @required this.stationItem,
    @required Widget child,
  }) : super(key: key, child: child);

  static SearchInheritedWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(SearchInheritedWidget);
  }
  @override
  bool updateShouldNotify(SearchInheritedWidget oldWidget) {
    return stationItem != oldWidget.stationItem;
  }
}
