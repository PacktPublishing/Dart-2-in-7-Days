import 'package:flutter/material.dart';
import 'package:persisting_data_6_3/ui/entry.dart';

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: ListTile(
          title: Icon(Icons.add, color: Colors.white),
        ),
        onPressed: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context)=> Entry())
          );
        },
      ),


    );
  }
}
