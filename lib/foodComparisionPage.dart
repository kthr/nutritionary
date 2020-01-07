import 'package:flutter/material.dart';
import 'package:nutritionary/foodEntry.dart';

class FoodComparisionPage extends StatelessWidget {

  FoodComparisionPage(FoodEntry entry1, FoodEntry entry2) {
    _entry1 = entry1;
    _entry2 = entry2;
    _nutrientNames = _entry1.nutrientNames;
  }

  FoodEntry _entry1;
  FoodEntry _entry2;
  List<String> _nutrientNames;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(_entry1.name + ' vs. ' + _entry2.name),
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
                //child: Center(child: Text('${_ingredientNames[index]} – ${_entry1.ingredientAmount(_ingredientNames[index])} vs. ${_entry2.ingredientAmount(_ingredientNames[index])}')));
                child: compareAmounts(_nutrientNames[index], _entry1.nutrientAmount(_nutrientNames[index]), _entry2.nutrientAmount(_nutrientNames[index]))
              );
            }
        )
      )
    );
  }
}

Row compareAmounts(String name, double first, double second) {
  Text firstText, secondText;
  if(first < second) {
    firstText = new Text(first.toStringAsFixed(3), style: TextStyle(color: Color.fromARGB(255, 150, 150, 150)));
    secondText = new Text(second.toStringAsFixed(3));
  }
  else {
    firstText = new Text(first.toStringAsFixed(3));
    secondText = new Text(second.toStringAsFixed(3), style: TextStyle(color: Color.fromARGB(255, 150, 150, 150)));
  }
  return Row(mainAxisAlignment: MainAxisAlignment.start, 
    children: <Widget>[
    Container(width:200.0, child:Text(name)), Container(width:100.0, child:firstText), secondText
    ]
  );
}