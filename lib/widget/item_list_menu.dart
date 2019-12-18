import 'package:flutter/material.dart';
import 'package:hello_wolrd/screen/faq/screen_faq.dart';
import 'package:hello_wolrd/screen/question/screen_question.dart';

class ItemListMenu extends StatelessWidget {
  final IconData iconData;
  final String title;

  const ItemListMenu({Key key, this.iconData, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (title == "Question") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => QuestionScreen()));
        } else if (title == "FAQ") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FAQScreen()));
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
        child: Row(
          children: <Widget>[
            Icon(
              iconData,
              color: Colors.blue,
            ),
            Expanded(
              child: Container(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
                padding: const EdgeInsets.only(left: 20),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
