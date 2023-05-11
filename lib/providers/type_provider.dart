import '../models/type.dart';
import 'package:sqflite/sqflite.dart';


String tableName = "exercisetype";
String columnId = "id";
String columnName = "name";

class TypeProvider{
  final Database db;

  const TypeProvider({required this.db});


  Future<ExerciseType> insert(ExerciseType type) async {
    type.id = await db.insert(tableName, type.toMap());
    return type;
  }

  Future<ExerciseType?> getExerciseType(int id) async {
    List<Map<String,Object?>> maps = await db.query(tableName,
        columns: [columnId, columnName],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return ExerciseType.fromMap(maps.first);
    }
    return null;
  }
  Future<List<ExerciseType>?> getAllExerciseTypes() async {
    List<Map<String,Object?>> maps = await db.query(tableName,
        columns: [columnId, columnName]);
    if (maps.isNotEmpty) {
      List<ExerciseType>? types = [];
      for(int i = 0; i < maps.length; i++){
        types.add(ExerciseType.fromMap(maps[i]));
      }
      return types;
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(ExerciseType type) async {
    return await db.update(tableName, type.toMap(),
        where: '$columnId = ?', whereArgs: [type.id]);
  }

}