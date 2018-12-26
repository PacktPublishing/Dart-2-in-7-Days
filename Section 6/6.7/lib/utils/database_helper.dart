import 'package:persisting_data_6_3/model/student.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DatabaseHelper{
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  DatabaseHelper.internal();


  factory DatabaseHelper()=> _instance;

  final String studentTable = "studentTable";
  final String columnId = "id";
  final String columnFirstName = "firstName";
  final String columnLastName = "lastName";
  final String columnContactNumber = "contactNumber";

  //Create a static database
  static Database _db;

  Future<Database> get db async {
    if(_db != null){
      return _db;
    }

    _db = await initDB();
    return _db;
  }

  initDB() async{
    //Get location of the database
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    //Use the join method to join the path to the name of the database which is going to be "studentRecords.db"
    String path = join(documentDirectory.path, "studentRecord.db");

    //Storing the database in ourDB variable
    var ourDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDB;
  }


  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $studentTable($columnId INTEGER PRIMARY KEY, $columnFirstName TEXT, $columnLastName TEXT, "
          "$columnContactNumber TEXT)"
    );
  }



  //////////////////
  ///CREATE/////
  ////////////////

  //Whenever you insert data into a database it returns an integer value
  Future<int> saveStudent(Student student) async {
    //create an instance of the database client
    var dbClient = await db;
    int result = await dbClient.insert("$studentTable", student.toMap());
    return result;
  }

  /////////////
  ///READ/////
  ///////////

  //Get all Student Records
  Future<List>getStudentRecords()async{
    //create an instance of the database client
    var dbClient = await db;

    //perform a raw SQL Query
    var result = await dbClient.rawQuery("SELECT * FROM $studentTable");

    //use the .toList to ensure we return a list
    return result.toList();
  }


 //Get Specific Student
  Future<Student> getStudentRecord(int id)async {
    //create an instance of the database client
    var dbClient = await db;

    var result = await dbClient.rawQuery("SELECT * FROM $studentTable WHERE $columnId = $id");
    if (result.length == 0)return null;
    return new Student.fromMap(result.first);
  }


  //Get Count
  Future<int> getCount()async {
    //create an instance of the database client
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery("SELECT COUNT(*) FROM $studentTable"));
  }


  /////////////
  ///UPDATE/////
  ///////////

  Future<int>updateRecords(Student student) async {
    var dbClient = await db;
    return await dbClient.update("$studentTable", student.toMap(), where: "$columnId = ?", whereArgs: [student.id]);
  }


  //////////////
  ///DELETE/////
  /////////////

  Future<int> deleteRecord(int id) async {
    var dbClient = await db;
    return await dbClient.delete(studentTable, where: "$columnId = ?", whereArgs:  [id]);
  }


  //////////////////////
  ///CLOSE DATABASE/////
  /////////////////////

  Future close() async{
    var dbClient = await db;
    return dbClient.close();
  }



}