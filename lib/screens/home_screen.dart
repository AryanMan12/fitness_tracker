import 'package:flutter/material.dart';
import 'package:exercise_tracker/utils/colors.dart';
import 'package:exercise_tracker/widgets/home_card.dart';

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
        backgroundColor: secBackgroundColor,
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
            HomeCard(cardText: "Admin"),
          ],
        ));
  }
}
