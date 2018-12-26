import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';


//All Articles Mentioning Apple
final String _apiUrl1 = "https://newsapi.org/v2/everything?q=apple&from=" +
    currentDate +
    "&to=" + currentDate +
        "&sortBy=popularity&apiKey=7ed799e633ac490fb2487b48e6379705";

//Articles about bitcoin from the last month
final String _apiUrl2 = "https://newsapi.org/v2/everything?q=bitcoin&from=" + currentDate +
    "&sortBy=publishedAt&apiKey=7ed799e633ac490fb2487b48e6379705";

final String _apiUrl3 = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7ed799e633ac490fb2487b48e6379705";

//Variables to store the data
List _provider1;
List _provider2;
List _provider3;

List _provider;
String _headlines = "Apple News";


var now = new DateTime.now();
var formatter = new DateFormat('yyyy-MM-dd');
String currentDate = formatter.format(now);


void main() async{




  _provider1 = await fetchData(_apiUrl1);
  _provider2 = await fetchData(_apiUrl2);
  _provider3 = await fetchData(_apiUrl3);

  _provider = _provider1;






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

            drawer: Drawer(
              child: ListView(
                children: <Widget>[

                  DrawerHeader(
                    child: Text("CHOOSE A NEWS PROVIDER",
                      style: TextStyle(color: Colors.white, fontFamily: 'Times New Roman',
                      fontSize: 18.0),),
                    decoration: BoxDecoration(color: Colors.blue),
                  ),

                  ListTile(
                    title: Text("Apple News", style: TextStyle(
                      fontFamily: 'Times New Roman', fontSize: 18.0)),

                    subtitle: Text("News Articles Mentioning Apple",
                    style: TextStyle(fontFamily: 'Times New Roman', fontSize: 16.0, fontStyle: FontStyle.italic),
                    ),

                    onTap: (){

                      setState((){
                        _provider = _provider1;
                        _headlines = "Apple News";
                      });



                    },
                  ),


                  ListTile(
                    title: Text("Bitcoin News", style: TextStyle(
                        fontFamily: 'Times New Roman', fontSize: 18.0)),

                    subtitle: Text("Articles about Bitcoin from the Past Month",
                      style: TextStyle(fontFamily: 'Times New Roman', fontSize: 16.0, fontStyle: FontStyle.italic),
                    ),

                    onTap: (){
                      setState(() {
                        _provider = _provider2;
                        _headlines = "Bitcoin News";
                      });
                    },
                  ),


                  ListTile(
                    title: Text("Business Headlines", style: TextStyle(
                        fontFamily: 'Times New Roman', fontSize: 18.0)),

                    subtitle: Text("Top Business Headlines",
                      style: TextStyle(fontFamily: 'Times New Roman', fontSize: 16.0, fontStyle: FontStyle.italic),
                    ),

                    onTap: (){
                      setState(() {
                        _provider = _provider3;
                        _headlines = "Business Headlines";
                      });
                    },
                  ),




                ],




              ),
            ),


            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              title: Text("${_headlines.toUpperCase()}",
              style: TextStyle(fontFamily: 'Times New Roman')),
              elevation: 3.0,
              backgroundColor: Colors.blue.withOpacity(0.5),
            ),


            body: Center(
              child: ListView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int position){

                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                          ListTile(
                            title: CachedNetworkImage(
                                imageUrl: "${_provider[position]['urlToImage']}",
                            placeholder: CircularProgressIndicator(),
                              errorWidget: Icon(Icons.error),
                            ),


                            subtitle: Text("${_provider[position]['title']}",
                            style: TextStyle(fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                              fontFamily: 'Times New Roman'
                            ),),

                            onTap: ()=> _showNewsSnippet(context, _provider[position]['description']),

                          )

                        ],
                      ),

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


void _showNewsSnippet(BuildContext context, String snippet){
  var alert = AlertDialog(
    title: Text("Headlines", style: TextStyle(
      fontSize: 16.0, fontFamily: "Times New Roman", fontWeight: FontWeight.w500
    ),),

    content: Text(snippet),
    actions: <Widget>[
      FlatButton(
        child: Text("Dismiss", style: TextStyle(
          fontSize: 16.0, fontFamily: "Times New Roman", fontStyle: FontStyle.italic
        )),

        onPressed: ()=>Navigator.pop(context),
      )
    ],
  );

  showDialog(context: context, builder: (context)=> alert);



}









