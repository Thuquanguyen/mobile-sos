import 'package:flutter/cupertino.dart';

class FAQItem {
  String expandedValue;
  String headervalue;
  bool isExpanded;

  FAQItem(
      {@required this.expandedValue,
      @required this.headervalue, this.isExpanded = false});

}
