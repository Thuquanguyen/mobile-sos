import 'package:flutter/material.dart';
import 'package:hello_wolrd/screen/question/screen_question.dart';

class ItemListMenu extends StatelessWidget {
  final IconData iconData;
  final String title;

  const ItemListMenu({Key key, this.iconData, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (title == "Question") {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionScreen()));
        }
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(
              iconData,
              color: Colors.blue,
            ),
            Expanded(
              child: Container(
                child: Text(title,style: TextStyle(fontSize: 18),),
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
