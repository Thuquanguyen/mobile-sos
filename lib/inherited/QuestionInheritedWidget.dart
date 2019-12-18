import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/question_item.dart';

class QuestionInheritedWidget extends InheritedWidget {
  final List<QuestionItem> questionItem;

  const QuestionInheritedWidget({
    Key key,
    @required this.questionItem,
    @required Widget child,
  }) : super(key: key, child: child);

  static QuestionInheritedWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(QuestionInheritedWidget);
  }
  @override
  bool updateShouldNotify(QuestionInheritedWidget oldWidget) {
    return questionItem != oldWidget.questionItem;
  }
}
