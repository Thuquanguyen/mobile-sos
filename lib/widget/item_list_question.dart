import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/question_item.dart';
import 'package:hello_wolrd/screen/question/screen_details_question.dart';

class ItemListQuestion extends StatelessWidget {
  final QuestionItem questionItem;
  final BuildContext mcontext;

  const ItemListQuestion({Key key, this.questionItem, this.mcontext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: new Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.only(bottom: 5.0),
        decoration: new BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                spreadRadius: 1.0,
              )
            ],
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(color: Colors.white)),
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(
                questionItem.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: new Text(questionItem.subTitle),
            ),
            new Container(
              padding: const EdgeInsets.only(left: 15.0),
              child: new Text(
                "Result: ${questionItem.result}",
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(mcontext).push(MaterialPageRoute(
            builder: (context) =>
                DetailsQuestionScreen(questionItem: questionItem)));
      },
    );
  }
}
