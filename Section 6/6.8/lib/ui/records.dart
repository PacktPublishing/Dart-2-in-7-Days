import 'package:flutter/material.dart';
import 'package:persisting_data_6_3/model/student.dart';
import 'package:persisting_data_6_3/ui/edit.dart';
import 'package:persisting_data_6_3/ui/entry.dart';
import 'package:persisting_data_6_3/utils/database_helper.dart';


class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {

  final List<Student> _studentRecords = <Student>[];
  var db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _readDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: false,
                itemCount: _studentRecords.length,
                itemBuilder: (_, int index){
                  return Card(
                    child: ListTile(
                      title: _studentRecords[index],
                      onLongPress: ()=> _editStudent(_studentRecords[index], index),
                      trailing: Listener(
                        key: Key(_studentRecords[index].firstName),
                        child: Icon(Icons.remove_circle, color: Colors.red),
                        onPointerDown: (pointerEvent)=>_deleteStudent(_studentRecords[index].id, index),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),


      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          child: ListTile(
            title: Icon(Icons.add, color: Colors.white),
          ),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> Entry())
            );
          }),
    );
  }


  void _readDatabase()async{
    List studentInfo = await db.getStudentRecords();
        studentInfo.forEach((studentInfoItem){
          Student student = Student.fromMap(studentInfoItem);
          setState(() {
            _studentRecords.add(Student.fromMap(studentInfoItem));
          });
        });
  }


  void _deleteStudent(int id, int index)async {
    await db.deleteRecord(id);
    setState(() {
      _studentRecords.removeAt(index);
    });
  }

  void _editStudent(Student student, int index)async{
    student = _studentRecords[index];
    var route = MaterialPageRoute(builder: (BuildContext context)=> Edit(student: student));
    Navigator.of(context).push(route);
  }

}


