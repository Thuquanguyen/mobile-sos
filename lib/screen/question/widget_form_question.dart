import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/question_item.dart';
import 'package:hello_wolrd/widget/item_list_question.dart';

class QuestionList extends StatelessWidget {
  final List<QuestionItem> data;

  const QuestionList({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ItemListQuestion(
            questionItem: data[index],
          );
        });
  }
}
