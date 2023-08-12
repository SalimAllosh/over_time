import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../Features/OverTime/DataLayer/Model/session_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<Either<Failure, Unit>> _onCreate(Database db, int version) async {
    try {
      await db.execute('''
      CREATE TABLE session_table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_name TEXT NOT NULL,
        subject TEXT NOT NULL,
        session_type TEXT NOT NULL,
        date TEXT NOT NULL,
        institute_name TEXT NOT NULL,
        duration REAL NOT NULL,
        hourly_rate REAL NOT NULL,
        cost REAL NOT NULL
      )
    ''');

      await db.execute('''
      INSERT INTO session_table(student_name,subject,session_type,date,institute_name,duration,hourly_rate,cost) VALUES ('salim1','math','online','2023-08-07 14:30:15.000','institute_name',2,10,20)

''');
      await db.execute('''
      INSERT INTO session_table(student_name,subject,session_type,date,institute_name,duration,hourly_rate,cost) VALUES ('salim11','math13','Offline','2023-08-07 14:30:15.000','institute_name',2,10,20)

''');
      await db.execute('''
      INSERT INTO session_table(student_name,subject,session_type,date,institute_name,duration,hourly_rate,cost) VALUES ('salim1221','math123','online','2023-08-07 14:30:15.000','institute_name',2,10,20)

''');
      await db.execute('''
      INSERT INTO session_table(student_name,subject,session_type,date,institute_name,duration,hourly_rate,cost) VALUES ('salim11121','math13','online','2023-08-07 14:30:15.000','institute_name',2,10,20)

''');

      return right(unit);
    } catch (e) {
      return left(DatabaseFailure());
    }
  }

  Future<List<Session>> readData(String sql) async {
    Database? db = await database;

    List<Map<String, dynamic>> response = await db.rawQuery(sql);

    List<Session> jsonToSessionObject = response.map<Session>((session) {
      return Session.fromMap(session);
    }).toList();

    return Future.value(jsonToSessionObject);
  }

  insertData(String sql) async {
    Database? db = await database;

    int response = await db.rawInsert(sql);

    return response;
  }

  deleteData(String sql) async {
    Database? db = await database;

    int response = await db.rawDelete(sql);

    return response;
  }

  updatetData(String sql) async {
    Database? db = await database;

    int response = await db.rawInsert(sql);

    return response;
  }
}
