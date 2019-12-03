import 'package:flutter/material.dart';

class FoodInfoPage extends StatelessWidget {

  String _name;

  FoodInfoPage(String name) {
    _name = name;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(_name),
        leading: IconButton(icon:Icon(Icons.arrow_back), onPressed:() => Navigator.pop(context, false),
        )
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Column()
      )
    );
  }
}