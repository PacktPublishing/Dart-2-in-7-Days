import 'package:flutter/material.dart';
import 'package:studentinfo/model/student.dart';
import 'package:studentinfo/utils/database_helper.dart';

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
    _firstNameController.text = widget.student.firstName;
    _lastNameController.text = widget.student.lastName;
    _contactNumberController.text = widget.student.contactNumber;
    _addressLine1Controller.text = widget.student.addressLine1;
    _addressLine2Controller.text = widget.student.addressLine2;
    _emailController.text = widget.student.email;

    _fathersNameController.text = widget.student.fathersName;
    _fathersContactController.text = widget.student.fathersContact;
    _mothersNameController.text = widget.student.mothersName;
    _mothersContactController.text = widget.student.mothersContact;
    _allergiesController.text = widget.student.allergies;

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: false,
        title: Text("UpdateStudent",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto"
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: (){
              _updateStudentRecord(_firstNameController.text, _lastNameController.text,
                  _contactNumberController.text, _addressLine1Controller.text, _addressLine2Controller.text,
                  _emailController.text, _fathersNameController.text, _fathersContactController.text,
                  _mothersNameController.text, _mothersContactController.text, _allergiesController.text);

              Navigator.popAndPushNamed(context, '/home');
            },
          )
        ],
      ),

      body: Stack(
        children: <Widget>[
          Form(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(), // new
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
                      labelText: 'Email'
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
              ],
            ),
          ),
        ],
      ),

    );
  }

  _updateStudentRecord(String firstName, String lastName, String contactNumber, String addressLine1, String addressLine2,
      String email, String fathersName, String fathersContact, String mothersName, String mothersContact, String allergies)async{
    Student student = Student.fromMap({
      "firstName": firstName,
      "lastName": lastName,
      "contactNumber": contactNumber,
      "addressLine1": addressLine1,
      "addressLine2": addressLine2,
      "id": widget.student.id,
      "email": email,
      "fathersName": fathersName,
      "fathersContact": fathersContact,
      "mothersName": mothersName,
      "mothersContact": mothersContact,
      "allergies": allergies,
    });
    await db.updateRecords(student);
  }

}
