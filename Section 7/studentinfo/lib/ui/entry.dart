import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studentinfo/model/student.dart';

import 'package:studentinfo/utils/database_helper.dart';


class Entry extends StatefulWidget {



  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {


  final TextEditingController _firstNameController = new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _contactNumberController = new TextEditingController();
  final TextEditingController _addressLine1Controller = new TextEditingController();
  final TextEditingController _addressLine2Controller = new TextEditingController();

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _allergiesController = new TextEditingController();
  final TextEditingController _fathersContactController = new TextEditingController();
  final TextEditingController _fathersNameController = new TextEditingController();
  final TextEditingController _mothersNameController = new TextEditingController();
  final TextEditingController _mothersContactController = new TextEditingController();

  var db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: false,
        title: Text("AddInfo",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto"
            )),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.done),
            onPressed: (){
              _addInfo(
                  _firstNameController.text, _lastNameController.text,
                  _contactNumberController.text, _addressLine1Controller.text, _addressLine2Controller.text, _emailController.text,
                  _fathersNameController.text, _fathersContactController.text, _mothersNameController.text,
                  _mothersContactController.text, _allergiesController.text );

              Navigator.popAndPushNamed(context, '/home');
            },
          ),

          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              _firstNameController.clear();
              _lastNameController.clear();
              _contactNumberController.clear();
              _addressLine1Controller.clear();
              _addressLine2Controller.clear();

            },
          )

        ],
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

                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: 'Email.'
                  ),
                ),

                TextFormField(
                  controller: _allergiesController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: 'Allergies'
                  ),
                ),

                TextFormField(
                  controller: _addressLine1Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: 'Address Line 1'
                  ),
                ),

                TextFormField(
                  controller: _addressLine2Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: 'Address Line 2'
                  ),
                ),

                TextFormField(
                  controller: _fathersNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: "Father's Name"
                  ),
                ),

                TextFormField(
                  controller: _fathersContactController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: "Father's Contact"
                  ),
                ),

                TextFormField(
                  controller: _mothersNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: "Mother's Name"
                  ),
                ),

                TextFormField(
                  controller: _mothersContactController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: "Mother's Contact"
                  ),
                ),

                Padding(padding: EdgeInsets.all(10.0),),






              ],
            ),
          ),



        ],
      ),

    );
  }

  void _addInfo(String firstName, String lastName, String contactNumber, String addressLine1, String addressLine2, String email,
      String fathersName, String fathersContact, String mothersName, String mothersContact, String allergies) async {
//    _firstNameController.clear();
//    _lastNameController.clear();
//    _contactNumberController.clear();
//    _addressLine1Controller.clear();
//    _addressLine2Controller.clear();

    Student student = new Student(firstName, lastName, contactNumber, addressLine1, addressLine2, email, fathersName, fathersContact, mothersName, mothersContact, allergies);
    int savedStudent = await db.saveStudent(student);

    print("Item saved id: $savedStudent");
  }


}















