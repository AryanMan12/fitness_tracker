import 'package:sqflite/sqflite.dart';


class DbConnect{
  String dbName;
  late Database db;
  DbConnect({required this.dbName});

  Future<Database> open(String path) async {
    db =  await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
          create table Type ( 
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
        });
    return db;
  }

  Future close() async => db.close();

}