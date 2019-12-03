import 'dart:async';

import 'package:flutter/material.dart';

import 'package:elastic_client/console_http_transport.dart';
import 'package:elastic_client/elastic_client.dart' as elastic;

import 'package:nutritionary/foodInfoPage.dart';

class FoodSearchPage extends StatefulWidget {
  FoodSearchPage({Key key}) : super(key: key);

  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearchPage> {
  List<String> _searchResult = List<String>();
  final TextEditingController _searchQuery = new TextEditingController();
  Timer _debounce;

  Future<void> _onSearchChanged() async {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      List<String> result = await elasticQuery(_searchQuery.text);
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
          title: Text('What did I eat today?')),
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
              for (String entry in _searchResult)
                GestureDetector(
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodInfoPage(entry)));
                    },
                    child: Card(
                        child: ListTile(
                            leading: FlutterLogo(), title: Text(entry))))
            ]),
          ],
        ),
      ),
    );
  }
}

Future<List<String>> elasticQuery(String query) async {
  ConsoleHttpTransport _transport =
      new ConsoleHttpTransport(Uri.parse('http://localhost:9200/'));
  Client _client = new elastic.Client(_transport);
  List<String> results = List<String>();

  SearchResult queryResult = await _client.search(
      'foods', '', elastic.Query.match('Name', query),
      source: ['Name']);
  for (dynamic entry in queryResult.toMap()['hits']) {
    results.add(entry['doc']['Name']);
  }
  _transport.close();
  return results;
}
