import 'package:flutter/material.dart';
import 'package:persisting_data_6_3/ui/records.dart';
import 'package:persisting_data_6_3/utils/database_helper.dart';
import 'package:persisting_data_6_3/model/student.dart';


void main() async{


  runApp(MaterialApp(
    home: Home(),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context)=>Home()
    },
    debugShowCheckedModeBanner: false,
  ));

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("StudentRecords",
        style: TextStyle(
          fontSize: 24.0,
          fontFamily: "Roboto",
          color: Colors.white
        )),
        backgroundColor: Colors.purple,

      ),

      body: Records(),



    );
  }
}

