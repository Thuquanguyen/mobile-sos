import 'package:flutter/cupertino.dart';
import 'package:hello_wolrd/model/sqlite_station.dart';
import 'package:hello_wolrd/model/station_item.dart';

class FavoriteInheritedWidget extends InheritedWidget {
  final DatabaseStation databaseStation;

  FavoriteInheritedWidget({@required this.databaseStation, @required Widget child})
      : super(child: child);

  static FavoriteInheritedWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(FavoriteInheritedWidget);
  }

  @override
  bool updateShouldNotify(FavoriteInheritedWidget oldWidget) {
    return databaseStation != oldWidget.databaseStation;
  }
}
