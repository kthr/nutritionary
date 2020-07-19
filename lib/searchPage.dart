import 'dart:async';

import 'package:flutter/material.dart';

import 'package:nutritionary/foodEntry.dart';
import 'package:nutritionary/foodComparisionPage.dart';
import 'package:nutritionary/query.dart';

class FoodSearchComparisionPage extends StatefulWidget {
  
  FoodSearchComparisionPage(this._entry, {Key key}) : _searchEnabled = true, super(key: key);

  final FoodEntry _entry;
  final bool _searchEnabled;

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
      QuerySingleton query = QuerySingleton();
      List<FoodEntry> result = await query.queryNames(_searchQuery.text);
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
    QuerySingleton query = QuerySingleton();
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Compare "${widget._entry.name}" with?')),
      body: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            widget._searchEnabled ?
              TextField(
                  autofocus: true,
                  controller: _searchQuery,
                  decoration:
                      InputDecoration(hintText: 'Search incredient or recipe'),
              ) :
              SizedBox(),
            ListView(shrinkWrap: true, children: <Widget>[
              for (FoodEntry entry in _searchResult)
                GestureDetector(
                    onTap: () async {
                      FoodEntry result = await query.queryFoodEntryByID(entry.id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodComparisionPage(widget._entry, result)));
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
