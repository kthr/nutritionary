import 'package:flutter/material.dart';
import 'package:nutritionary/foodComparisionPage.dart';
import 'package:nutritionary/foodEntry.dart';
import 'package:nutritionary/foodSearchComparisionPage.dart';

class FoodInfoPage extends StatelessWidget {

  final FoodEntry _entry;
  final List<String> _nutrientNames;

  FoodInfoPage(this._entry) : _nutrientNames = _entry.nutrientNames;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(_entry.name),
        leading: IconButton(icon:Icon(Icons.arrow_back), onPressed:() => Navigator.pop(context, false),
        )
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _nutrientNames.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                //color: Colors.amber[colorCodes[index]],
                child: Dismissible(
                  key: Key(_nutrientNames[index]),
                  background: Text("Less\n${_nutrientNames[index]}", textAlign: TextAlign.left, softWrap: true),
                  secondaryBackground: Text("More\n${_nutrientNames[index]}", textAlign: TextAlign.right),
                  confirmDismiss: (direction) async {
                    if(direction == DismissDirection.endToStart) {
                      FoodSearchComparisionPage page = FoodSearchComparisionPage(_entry);
                    }
                  },
                  child: ListTile(
                    title: Text('${_nutrientNames[index]} – ${_entry.nutrientAmount(_nutrientNames[index])}')         
                  )
                )
              );
            })
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodSearchComparisionPage(_entry)));
          },
          child: Icon(Icons.timeline),
          backgroundColor: Colors.green,
        ),
    );
  }
}