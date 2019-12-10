import 'package:flutter/material.dart';
import 'package:hello_wolrd/inherited/SearchInheritedWidget.dart';
import 'package:hello_wolrd/model/Station.dart';
import 'package:hello_wolrd/model/StationItem.dart';
import 'package:hello_wolrd/screen/main/widget_list_search.dart';
import 'package:provider/provider.dart';

class FormSearch extends StatelessWidget {
  final List<StationItem> data;
  final String name;

  const FormSearch({Key key, this.data, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchInheritedWidget(stationItem: data, child: SearchView());
  }
}

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchInheritedWidget = SearchInheritedWidget.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
      child: Wrap(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    Provider.of<Station>(context).findNameStation(value);
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Tìm kiếm trạm',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        size: 20,
                      ),
                      onPressed: () {
                        _controller.text = "";
                        Provider.of<Station>(context).findNameStation("");
                      },
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14),
                  ),
                ),
              ),
              Visibility(
                  visible: Provider.of<Station>(context).isSearch,
                  child: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child:
                            SearchList(list: searchInheritedWidget.stationItem),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
