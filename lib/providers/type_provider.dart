import '../models/type.dart';
import 'package:sqflite/sqflite.dart';


String tableName = "type";
String columnId = "id";
String columnName = "name";

class TypeProvider{
  final Database db;

  const TypeProvider({required this.db});


  Future<Type> insert(Type type) async {
    type.id = await db.insert(tableName, type.toMap());
    return type;
  }

  Future<Type?> getType(int id) async {
    List<Map<String,Object?>> maps = await db.query(tableName,
        columns: [columnId, columnName],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Type.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Type type) async {
    return await db.update(tableName, type.toMap(),
        where: '$columnId = ?', whereArgs: [type.id]);
  }

}