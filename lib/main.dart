import 'package:exercise_tracker/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:exercise_tracker/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
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
