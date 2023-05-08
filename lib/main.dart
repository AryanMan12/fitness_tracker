import 'package:exercise_tracker/widgets/home_card.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Fitness Tracker',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 193, 7),
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black,
          elevation: 1,
        ),
        body: ListView(
          children: const [
            HomeCard(cardText: "Add Today's Data"),
            SizedBox(
              height: 5,
            ),
            HomeCard(cardText: "View Data"),
            SizedBox(
              height: 5,
            ),
            HomeCard(cardText: "Add Meta Data"),
          ],
        ));
  }
}
