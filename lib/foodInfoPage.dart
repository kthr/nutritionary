import 'package:flutter/material.dart';
import 'package:nutritionary/foodEntry.dart';
import 'package:nutritionary/foodSearchComparisionPage.dart';

class FoodInfoPage extends StatelessWidget {

  FoodEntry _entry;
  List<String> _nutrientNames;

  FoodInfoPage(FoodEntry entry) {
    _entry = entry;
    _nutrientNames = entry.nutrientNames;
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
            itemCount: _nutrientNames.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                //color: Colors.amber[colorCodes[index]],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                  Container(width:200.0, child:Text('${_nutrientNames[index]}')), 
                  Text('${_entry.nutrientAmount(_nutrientNames[index])}')]));
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