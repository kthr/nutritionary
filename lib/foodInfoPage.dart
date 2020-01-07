import 'package:flutter/material.dart';
import 'package:nutritionary/foodEntry.dart';
import 'package:nutritionary/foodSearchComparisionPage.dart';

class FoodInfoPage extends StatelessWidget {

  FoodEntry _entry;
  List<String> _ingredientNames;

  FoodInfoPage(FoodEntry entry) {
    _entry = entry;
    _ingredientNames = entry.ingredientNames;
  }
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
            itemCount: _ingredientNames.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                //color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('${_ingredientNames[index]} – ${_entry.ingredientAmount(_ingredientNames[index])}')));
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