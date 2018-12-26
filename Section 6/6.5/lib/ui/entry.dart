import 'package:flutter/material.dart';
import 'package:persisting_data_6_3/utils/database_helper.dart';

class Entry extends StatelessWidget {

  final TextEditingController _firstNameController = new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _contactController = new TextEditingController();

  var db = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Add Student",
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Roboto"
        ),),
      ),


      body: Stack(
        children: <Widget>[
          Form(
            child: ListView(
              children: <Widget>[

                TextFormField


              ],
            ),
          )
        ],
      ),



    );
  }
}
