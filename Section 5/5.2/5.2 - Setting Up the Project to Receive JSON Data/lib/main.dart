import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';

//All Articles Mentioning Apple
final String _apiUrl1 = "https://newsapi.org/v2/everything?q=apple&from=2018-10-13&to=2018-10-13&sortBy=popularity&apiKey=7ed799e633ac490fb2487b48e6379705";

//Articles about bitcoin from the last month
final String _apiUrl2 = "https://newsapi.org/v2/everything?q=bitcoin&from=2018-09-14&sortBy=publishedAt&apiKey=7ed799e633ac490fb2487b48e6379705";

//Variables to store the data




void main() {
  runApp(new MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("images/background.jpg", fit: BoxFit.cover,),

          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              title: Text("NEWS",
              style: TextStyle(fontFamily: 'Times New Roman')),
              elevation: 3.0,
              backgroundColor: Colors.blue.withOpacity(0.5),
            ),


          )

        ],

      ),
    );
  }
}











