import 'package:exercise_tracker/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:exercise_tracker/screens/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:exercise_tracker/providers/db_connect.dart';
import 'package:sqflite/sqflite.dart';

void main()  {
  // await Modular.isModuleReady<AppModule>();
  return runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    AsyncBind<Database>((i) => DbConnect(dbName: "fitness").open()),
  ];

  // @override
  // List<ModularRoute> get routes => [
  //   ChildRoute('/', child: (context, args) => Home()),
  // ];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Tracker',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const MyHomePage(
        title: 'Fitness Tracker',
      ),
    );
  }
}
