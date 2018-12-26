import 'package:flutter/material.dart';
import 'package:persisting_data_6_3/ui/records.dart';
import 'package:persisting_data_6_3/utils/database_helper.dart';
import 'package:persisting_data_6_3/model/student.dart';


void main() async{

  var db = new DatabaseHelper();

  int savedStudent = await db.saveStudent(new Student("Victor", "Wooding", "829-999-999"));

  print("Student: $savedStudent");


  runApp(MaterialApp(
    home: Home(),
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
            color: Colors.white,
        )),
        backgroundColor: Colors.purple,
      ),

      body: Records(),





    );
  }
}
