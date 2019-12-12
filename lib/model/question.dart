import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hello_wolrd/model/question_item.dart';
import 'package:http/http.dart' as http;

class Question with ChangeNotifier {
  List<QuestionItem> _items = [];
  List<QuestionItem> _itemSearch = [];


  List<QuestionItem> get listQuestion {
    return [..._items];
  }

  List<QuestionItem> get itemSearch {
    return [..._itemSearch];
  }

  QuestionItem findById(String id)
  {
     // ignore: unrelated_type_equality_checks
     return _itemSearch.firstWhere((question) => question.id == id);
  }
  // ignore: missing_return
  List<QuestionItem> findByTitle(String title) {
    _itemSearch = title != ""
        ? _items.where((question) =>
        question.title.toLowerCase().contains(title.toLowerCase())).toList()
        : _items;
    notifyListeners();
  }

  Future<void> fetchDataQuestion() async {
    const url = "https://sos-manage.firebaseio.com/questions.json";
    final respone = await http.get(url);
    List<QuestionItem> items = [];
    final extractData = json.decode(respone.body) as Map<String, dynamic>;
    if (extractData == null) {
      return;
    }
    extractData.forEach((questionId, questionData) {
      items.add(QuestionItem(id: questionData["id"],
          title: questionData["title"],
          subTitle: questionData["subTitle"],
          result: questionData["result"]));
    });
    _itemSearch = items.reversed.toList();
    _items = items.reversed.toList();
    print("lenght : ${_items.length}");
    notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }
}