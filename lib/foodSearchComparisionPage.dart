import 'dart:async';

import 'package:flutter/material.dart';

import 'package:nutritionary/foodEntry.dart';
import 'package:nutritionary/foodComparisionPage.dart';

class FoodSearchComparisionPage extends StatefulWidget {
  
  FoodSearchComparisionPage(this._entry, {Key key}) : super(key: key) {
  }

  final FoodEntry _entry;

  FoodEntry get entry {
    return _entry;
  }

  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearchComparisionPage> {
  List<FoodEntry> _searchResult = List<FoodEntry>();
  final TextEditingController _searchQuery = new TextEditingController();
  Timer _debounce;

  Future<void> _onSearchChanged() async {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      List<FoodEntry> result = await FoodEntry.searchByName(_searchQuery.text);
      setState(() {
        _searchResult = result;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _searchQuery.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchQuery.removeListener(_onSearchChanged);
    _searchQuery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Compare "${widget._entry.name}" with?')),
      body: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            TextField(
                autofocus: true,
                controller: _searchQuery,
                decoration:
                    InputDecoration(hintText: 'Search incredient or recipe')),
            ListView(shrinkWrap: true, children: <Widget>[
              for (FoodEntry entry in _searchResult)
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodComparisionPage(this.widget._entry,entry)));
                    },
                    child: Card(
                        child: ListTile(
                            leading: FlutterLogo(), title: Text(entry.name))))
            ]),
          ],
        ),
      ),
    );
  }
}

// Future<List<String>> elasticQuery(String query) async {
//   ConsoleHttpTransport _transport =
//       new ConsoleHttpTransport(Uri.parse('http://localhost:9200/'));
//   Client _client = new elastic.Client(_transport);
//   List<String> results = List<String>();

//   SearchResult queryResult = await _client.search(
//       'foods', '_doc', elastic.Query.match('Name', query), source: []);
//   for (dynamic entry in queryResult.toMap()['hits']) {
//     results.add(entry['doc']['Name']);
//     print(entry);
//     //entry['doc'].forEach((k,v) => print('double _${k.toLowerCase()} =  -1.0;'));
//   }
//   _transport.close();
//   return results;
// }
