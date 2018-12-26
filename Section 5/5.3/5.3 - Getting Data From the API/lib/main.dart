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
List _provider1;
List _provider2;

List _provider;
//String _headlines = "Apple News";



void main() async{

  _provider1 = await fetchData(_apiUrl1);
  _provider2 = await fetchData(_apiUrl2);

  _provider = _provider1;

  for(int i=0; i<_provider.length; i++){
    print(_provider[i]['title']);
  }




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


            body: Center(
              child: ListView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: _provider.length,
                  itemBuilder: (BuildContext context, int position){

                    return Card(

                    );

                  }),
            ),

          )

        ],

      ),
    );
  }
}


//Functions
Future<List>fetchData(String apiUrl)async {
  http.Response response = await http.get(apiUrl);
  return (json.decode(response.body))['articles'];
}









