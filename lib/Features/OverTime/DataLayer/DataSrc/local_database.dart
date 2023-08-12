import 'package:over_time/Core/Database/database.dart';
import 'package:over_time/Features/OverTime/DataLayer/Model/session_model.dart';

class LocalDatabase {
  final DatabaseHelper database;

  LocalDatabase({required this.database});

  Future<List<Session>> getAllsessions(String sql) async {
    return database.readData(sql);
  }
}
