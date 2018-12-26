import 'package:flutter/material.dart';
import 'package:persisting_data_6_3/model/student.dart';
import 'package:persisting_data_6_3/utils/database_helper.dart';


class Entry extends StatefulWidget {



  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {

  final TextEditingController _firstNameController = new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _contactNumberController = new TextEditingController();

  var db = new DatabaseHelper();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: false,
        title: Text("Add Student",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto"
            )),
        backgroundColor: Colors.purple,
      ),


      body: Stack(
        children: <Widget>[
          Form(
            child: ListView(
              children: <Widget>[


                TextFormField(
                  controller: _firstNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: 'First Name'
                  ),
                ),

                TextFormField(
                  controller: _lastNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: 'Last Name'
                  ),
                ),


                TextFormField(
                  controller: _contactNumberController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: 'Contact No.'
                  ),
                ),

              ],
            ),
          ),


          Positioned(
            left: 5.0,
            right: 5.0,
            bottom: 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                RaisedButton(
                  child: Text("Add Info", style: TextStyle(
                      color: Colors.white, fontSize: 20.0
                  ),),
                  padding: EdgeInsets.all(5.0),
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    _addInfo(
                        _firstNameController.text, _lastNameController.text,
                        _contactNumberController.text);
                    Navigator.popAndPushNamed(context, '/home');
                  },
                ),

                RaisedButton(
                  child: Text("Reset", style: TextStyle(
                      color: Colors.white, fontSize: 20.0
                  ),),
                  padding: EdgeInsets.all(5.0),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    _firstNameController.clear();
                    _lastNameController.clear();
                    _contactNumberController.clear();
                  },
                ),


              ],
            ),


          )

        ],
      ),

    );
  }

  void _addInfo(String firstName, String lastName, String contactNumber) async {
    _firstNameController.clear();
    _lastNameController.clear();
    _contactNumberController.clear();

    Student student = new Student(firstName, lastName, contactNumber);
    int savedStudent = await db.saveStudent(student);

    print("Item saved id: $savedStudent");
  }


}















