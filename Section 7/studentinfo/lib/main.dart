import 'package:flutter/material.dart';
import 'package:studentinfo/ui/edit.dart';
import 'package:studentinfo/ui/entry.dart';
import 'package:studentinfo/utils/database_helper.dart';
import 'package:studentinfo/model/student.dart';



var _data;

void main() async{
  var db = new DatabaseHelper();
  _data = await db.getStudentRecords();


  runApp(MaterialApp(
    home: Records(),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => Records()
    },
    debugShowCheckedModeBanner: false,
  ));
}

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
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(

          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.purple,
            centerTitle: false,
            title: Text("StudentInfo",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 22.0
              ),),

            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> Entry())
                  );
                },
              )
            ],




          ),


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
                            child: Icon(Icons.delete, color: Colors.red),
                            onPointerDown: (pointerEvent)=>_deleteStudent(_studentRecords[index].id, index),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        )
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


