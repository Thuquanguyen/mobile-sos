import 'package:flutter/material.dart';
import 'package:hello_wolrd/model/question_item.dart';

class DetailsQuestionScreen extends StatelessWidget {
  static const routeName = '/details';
  final QuestionItem questionItem;

  const DetailsQuestionScreen({Key key, this.questionItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Details"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: ListTile(
                        title: Text(questionItem.title,style: TextStyle(fontSize: 18),),
                        subtitle: Container(
                            child: SingleChildScrollView(
                                child: Text(questionItem.result,style: TextStyle(fontSize: 16),),
                                scrollDirection: Axis.vertical),
                            padding: const EdgeInsets.only(top: 10))))
              ],
            ),
          )),
    );
  }
}
