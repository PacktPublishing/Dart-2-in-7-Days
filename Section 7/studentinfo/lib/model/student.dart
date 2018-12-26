import 'package:flutter/material.dart';


class Student extends StatelessWidget{
  String _firstName;
  String _lastName;
  String _contactNumber;
  String _addressLine1;
  String _addressLine2;
  int _id;
  String _email;
  String _fathersName;
  String _fathersContact;
  String _mothersName;
  String _mothersContact;
  String _allergies;


  Student(this._firstName, this._lastName, this._contactNumber,
      this._addressLine1, this._addressLine2, this._email, this._fathersName,
      this._fathersContact, this._mothersName, this._mothersContact,
      this._allergies);

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get contactNumber => _contactNumber;
  String get addressLine1 => _addressLine1;
  String get addressLine2 => _addressLine2;
  String get email => _email;
  String get fathersName => _fathersName;
  String get fathersContact => _fathersContact;
  String get mothersName => _mothersName;
  String get mothersContact => _mothersContact;
  String get allergies => _allergies;
  int get id => _id;


  Student.fromMap(Map<String, dynamic>map){
    this._firstName = map["firstName"];
    this._lastName = map["lastName"];
    this._contactNumber = map["contactNumber"];
    this._addressLine1 = map["addressLine1"];
    this._addressLine2 = map["addressLine2"];
    this._id = map["id"];
    this._email = map["email"];
    this._fathersName = map["fathersName"];
    this._fathersContact = map["fathersContact"];
    this._mothersName = map["mothersName"];
    this._mothersContact = map["mothersContact"];
    this._allergies = map["allergies"];
  }


  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["contactNumber"] = _contactNumber;
    map["addressLine1"] = _addressLine1;
    map["addressLine2"] = _addressLine2;
    map["email"] = _email;
    map["fathersName"] = _fathersName;
    map["fathersContact"] = _fathersContact;
    map["mothersName"] = _mothersName;
    map["mothersContact"] = _mothersContact;
    map["allergies"] = _allergies;


    if(id != null){
      map['id'] = _id;
    }
    return map;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("${_lastName.toUpperCase()}, $_firstName",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: "Roboto"
            ),),

          Text("Allergies: $_allergies",
            maxLines: null,
            style: TextStyle(
                color: Colors.red,
                fontSize: 14.0,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500
            ),),

          Text("$_contactNumber",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontFamily: "Roboto",
                fontStyle: FontStyle.italic
            ),),

          Text("$_email",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontFamily: "Roboto",
                fontStyle: FontStyle.italic
            ),),

          Text("$_addressLine1",
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14.0,
                fontFamily: "Roboto",
                fontStyle: FontStyle.italic
            ),),

          Text("$_addressLine2",
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14.0,
                fontFamily: "Roboto",
                fontStyle: FontStyle.italic
            ),),

          Text("$_fathersName",
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14.0,
                fontFamily: "Roboto",
                fontStyle: FontStyle.italic
            ),),

          Text("$_fathersContact",
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14.0,
                fontFamily: "Roboto",
                fontStyle: FontStyle.italic
            ),),

          Text("$_mothersName",
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14.0,
                fontFamily: "Roboto",
                fontStyle: FontStyle.italic
            ),),

          Text("$_mothersContact",
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14.0,
                fontFamily: "Roboto",
                fontStyle: FontStyle.italic
            ),),

        ],
      ),
    );

  }




}
