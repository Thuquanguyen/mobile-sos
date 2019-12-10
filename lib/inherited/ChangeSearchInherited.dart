import 'package:flutter/material.dart';

class ChangeSearchInherited extends InheritedWidget{
  final String name;

  const ChangeSearchInherited({@required this.name,@required Widget child}): super(child: child);

  static ChangeSearchInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ChangeSearchInherited);
  }
  @override
  bool updateShouldNotify(ChangeSearchInherited oldWidget) {
    return name != oldWidget.name;
  }
}