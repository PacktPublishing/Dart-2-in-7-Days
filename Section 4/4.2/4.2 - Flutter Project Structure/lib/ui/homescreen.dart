import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Dart 2 in 7 Days"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: new Container(
        alignment: Alignment.center,
        child: new RaisedButton(
            child: new Text("Dart 2 is Fun",
            style: new TextStyle(fontSize: 20.0),
            ),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: ()=> debugPrint("Dart 2 is fun")),
      ),


    );
  }
}