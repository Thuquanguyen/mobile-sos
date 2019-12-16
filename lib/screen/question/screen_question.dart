import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_wolrd/inherited/QuestionInheritedWidget.dart';
import 'package:hello_wolrd/model/question_provider.dart';
import 'package:hello_wolrd/screen/menu/screen_menu.dart';
import 'package:hello_wolrd/screen/question/widget_form_question.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FutureBuilder(
              future: Provider.of<Question>(context, listen: false)
                  .fetchDataQuestion(),
              builder: (context, data) {
                if (data.connectionState == ConnectionState.waiting) {
                  return Center(child: CupertinoActivityIndicator());
                } else if (data.error != null) {
                  return Center(
                      child: Text(
                          "Error! An error occurred. Please try again later"));
                } else {
                  return Consumer<Question>(
                      builder: (context, data, child) =>
                          QuestionInheritedWidget(
                              questionItem: data.itemSearch,
                              mContext: context,
                              child: QuestionView()));
                }
              })),
    );
  }
}

class QuestionView extends StatefulWidget {
  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchInheritedWidget = QuestionInheritedWidget.of(context);
    return Stack(
      children: <Widget>[
        new Container(
          height: (20 * MediaQuery.of(context).size.height) / 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0)),
            color: Colors.lightBlue,
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  top: 40, left: 10, right: 10, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(children: <Widget>[
                IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.blue,size: 20), onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MenuScreen()));
                }),
                Expanded(child: TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    Provider.of<Question>(context).findByTitle(value);
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Tìm kiếm câu hỏi',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        size: 20,
                      ),
                      onPressed: () {
                        _controller.text = "";
                        Provider.of<Question>(context).findByTitle("");
                      },
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14),
                  ),
                ))
              ],),
            ),
            Expanded(
                child: QuestionList(
              data: searchInheritedWidget.questionItem,
              mContext: searchInheritedWidget.mContext,
            ))
          ],
        )
      ],
    );
  }
}
