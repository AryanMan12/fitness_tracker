import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DbConnect{
  String dbName;
  late Database db;
  DbConnect({required this.dbName});

  List<String> defaultExerciseTypes = ["chest","shoulders","back","arms", "core", "cardio","crossfit"];

  Future<Database> open() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, "$dbName.db");
    db =  await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
          create table ExerciseType ( 
            id integer primary key autoincrement, 
            name text not null)
          ''');

          await db.execute('''
          create table exercise ( 
            ed integer primary key autoincrement, 
            name text not null,
            typeId integer not null
            )
          ''');
          for(int i = 0; i<defaultExerciseTypes.length; i++){
            String current = defaultExerciseTypes[i];
            await db.execute('''
          insert into ExerciseType (name) values ('$current');
          ''');
          }

        });
    return db;
  }

  Future close(db) async => db.close();

}