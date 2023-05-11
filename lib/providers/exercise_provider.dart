import '../models/exercise.dart';
import 'package:sqflite/sqflite.dart';

String tableName = "exercise";
String columnId = "id";
String columnName = "name";
String columnTypeId = "typeId";

class ExerciseProvider{
  final Database db;

  const ExerciseProvider({required this.db});

  Future<Exercise> insert(Exercise exercise) async {
    exercise.id = await db.insert(tableName, exercise.toMap());
    return exercise;
  }

  Future<Exercise?> getExercise(int id) async {
    List<Map<String,Object?>> maps = await db.query(tableName,
        columns: [columnId, columnName],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Exercise.fromMap(maps.first);
    }
    return null;
  }
  Future<List<Exercise>?> getAllExercises() async {
    List<Map<String,Object?>> maps = await db.query(tableName,
        columns: [columnId, columnName,columnTypeId]);
    if (maps.isNotEmpty) {
      List<Exercise>? exercises = [];
      for(int i = 0; i < maps.length; i++){
        exercises.add(Exercise.fromMap(maps[i]));
      }
      return exercises;
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Exercise exercise) async {
    return await db.update(tableName, exercise.toMap(),
        where: '$columnId = ?', whereArgs: [exercise.id]);
  }


}