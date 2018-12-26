import 'package:flutter/material.dart';


class Student extends StatelessWidget{
  String _firstName;
  String _lastName;
  String _contactNumber;
  String _addressLine1;
  String _addressLine2;
  int _id;

  Student(this._firstName, this._lastName, this._contactNumber, this._addressLine1, this._addressLine2);


  String get firstName => _firstName;
  String get lastName => _lastName;
  String get contactNumber => _contactNumber;
  String get addressLine1 => _addressLine1;
  String get addressLine2 => _addressLine2;
  int get id => _id;


  Student.fromMap(Map<String, dynamic>map){
    this._firstName = map["firstName"];
    this._lastName = map["lastName"];
    this._contactNumber = map["contactNumber"];
    this._addressLine1 = map["addressLine1"];
    this._addressLine2 = map["addressLine2"];
    this._id = map["id"];
  }


  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["contactNumber"] = _contactNumber;
    map["addressLine1"] = _addressLine1;
    map["addressLine2"] = _addressLine2;

    if(id != null){
      map['id'] = _id;
    }
    return map;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("${_lastName.toUpperCase()}, $_firstName",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: "Roboto"
                ),),

              Text("$_contactNumber",
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



            ],
          )
        ],
      ),
    );
  }






}
