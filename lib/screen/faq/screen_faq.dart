import 'package:flutter/material.dart';
import 'package:hello_wolrd/data/FAQData.dart';
import 'package:hello_wolrd/model/faq_item.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "How does this work?",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: width / 4),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "FAQ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              Expanded(child: ListFAQ())
            ],
          ),
        ),
      ),
    );
  }
}

class ListFAQ extends StatefulWidget {
  @override
  _ListFAQState createState() => _ListFAQState();
}

class _ListFAQState extends State<ListFAQ> {
  List<FAQItem> _data = FAQData().listFAQ;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((FAQItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headervalue),
            );
          },
          body: Padding(
              padding: const EdgeInsets.only(left: 15,bottom: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(item.expandedValue))),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
