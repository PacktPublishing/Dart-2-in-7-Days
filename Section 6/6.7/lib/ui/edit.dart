import 'package:flutter/material.dart';
import 'package:persisting_data_6_3/model/student.dart';
import 'package:persisting_data_6_3/utils/database_helper.dart';

class Edit extends StatefulWidget {
  Student student;
  Edit({Key key, this.student}) : super(key: key);
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  final TextEditingController _firstNameController = new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _contactNumberController = new TextEditingController();

  var db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.student.firstName;
    _lastNameController.text = widget.student.lastName;
    _contactNumberController.text = widget.student.contactNumber;

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: false,
        title: Text("Update Student",
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
                  child: Text("Update Info", style: TextStyle(
                      color: Colors.white, fontSize: 20.0
                  ),),
                  padding: EdgeInsets.all(5.0),
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    _updateStudentRecord(_firstNameController.text, _lastNameController.text, _contactNumberController.text);

                    Navigator.popAndPushNamed(context, '/home');


                  },
                ),




              ],
            ),


          )

        ],
      ),

    );
  }

  _updateStudentRecord(String firstName, String lastName, String contactNumber)async{
    Student student = Student.fromMap({
      "firstName": firstName,
      "lastName": lastName,
      "contactNumber": contactNumber,
      "id": widget.student.id
    });
    await db.updateRecords(student);


  }











}
