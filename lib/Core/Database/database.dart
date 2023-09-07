import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../Features/InstituteDash/DataLayer/Model/session_model.dart';

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
      CREATE TABLE Institutes(
      Institute_Id INTEGER PRIMARY KEY AUTOINCREMENT, 
      Institute_Name TEXT NOT NULL, 
      Institute_Location TEXT,
      Institute_Balance REAL
    )
    ''');

      await db.execute('''
      CREATE TABLE subjects(
      Subject_Id INTEGER PRIMARY KEY AUTOINCREMENT, 
      Subject_Name TEXT NOT NULL , 
      Subject_Description TEXT  
      )
    ''');

      await db.execute('''
      CREATE TABLE Student(
      Student_Id INTEGER PRIMARY KEY AUTOINCREMENT, 
      Student_Name TEXT NOT NULL , 
      Student_Notes TEXT  
      )
    ''');

      await db.execute('''
      CREATE TABLE Courses(
      Course_Id INTEGER PRIMARY KEY AUTOINCREMENT, 
      Institute_Id INTEGER,
      Subject_Id INTEGER,
      Student_Id INTEGER ,
      Start_Date DATE NOT NULL ,
      End_Date DATE , 
      Course_Type TEXT NOT NULL , 
      Hourly_Rate REAL NOT NULL,
      Student_Name TEXT NOT NULL , 
      Student_Notes TEXT ,
      Course_Duration REAL ,
      Sessions_Number INTEGER,
      Total REAL , 
      FOREIGN KEY (Institute_Id) REFERENCES Institutes(Institute_Id),
      FOREIGN KEY (Subject_Id) REFERENCES Subjects (Subject_Id),
      FOREIGN KEY (Student_Id) REFERENCES Student (Student_Id)
    )
    ''');

      await db.execute('''
      CREATE TABLE Payments(
      Payment_Id INTEGER PRIMARY KEY AUTOINCREMENT,
      Institute_Id INTEGER,
      Payment_Date DATE NOT NULL,
      Payment_Amount REAL NOT NULL , 
      FOREIGN KEY (Institute_Id) REFERENCES Institutes(Institute_Id)
      )
    ''');

      await db.execute('''
      CREATE TABLE Sessions (
        Session_Id INTEGER PRIMARY KEY AUTOINCREMENT,
        Course_Id INTEGER,
        Duration INTEGER,
        Session_Date DATE,
        FOREIGN KEY (Course_Id) REFERENCES Courses (Course_Id)
      )
    ''');

      await db.execute('''
      INSERT INTO Institutes (Institute_Name, Institute_Location, Institute_Balance)
      VALUES
          ('ABC Institute', 'City A', 50000.00),
          ('XYZ Academy', 'City B', 75000.00),
          ('123 School', 'City C', 30000.00);
      ''');
      await db.execute('''
      INSERT INTO Subjects (Subject_Name, Subject_Description)
      VALUES
          ('Mathematics', 'Algebra, Geometry, Calculus'),
          ('Science', 'Physics, Chemistry, Biology'),
          ('History', 'Ancient, Modern, World History');
''');
      await db.execute('''
      INSERT INTO Student (Student_Name, Student_Notes)
      VALUES
          ('John Doe', 'Excellent in Math'),
          ('Jane Smith', 'Enjoys Science subjects'),
          ('Michael Johnson', 'History enthusiast');
''');
      await db.execute('''
     INSERT INTO Courses (Institute_Id, Subject_Id, Student_Id, Start_Date, End_Date, Course_Type, Hourly_Rate, Student_Name, Student_Notes, Course_Duration, Total)
     VALUES
        (1, 1, 1, '2023-07-01', '2023-12-31', 'Regular', 25.00, 'John Doe', 'Mathematics course', 150.0, 3750.00),
        (2, 2, 2, '2023-08-15', '2023-11-15', 'Intensive', 30.00, 'Jane Smith', 'Science course', 90.0, 2700.00),
        (3, 3, 3, '2023-09-01', '2023-10-15', 'Regular', 20.00, 'Michael Johnson', 'History course', 75.0, 1500.00);

''');

      await db.execute('''
    INSERT INTO Sessions (Course_Id, Duration, Session_Date)
    VALUES (1 ,3.00, '12-12-2023');
''');

      await db.execute('''
INSERT INTO Payments (Institute_Id, Payment_Date, Payment_Amount)
VALUES
    (1, '2023-07-15', 1500.00),
    (2, '2023-08-20', 2000.00),
    (3, '2023-09-10', 800.00);
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
