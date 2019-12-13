import 'package:flutter/material.dart';
import 'package:hello_wolrd/widget/item_list_menu.dart';

class ListMenu extends StatelessWidget {
  var arrMenu = ["Question","About Us","Help","Rate the app","Share","Sign Out"];
  var arrIcons = [Icons.question_answer,Icons.info,Icons.help,Icons.star,Icons.share,Icons.power_settings_new];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 3 / 4,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(top: 15,bottom: 15),
              child: ItemListMenu(
                  iconData: arrIcons[index], title: arrMenu[index]),
              color: index % 2 == 0?Colors.white30:Colors.white,
            );
          },
          itemCount: arrMenu.length),
    );
  }
}
