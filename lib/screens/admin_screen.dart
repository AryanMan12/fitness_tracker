import 'package:exercise_tracker/utils/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/home_card.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  addExercise(String text, String dropdownValue) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secBackgroundColor,
      appBar: AppBar(
        title: const Text("Admin Page"),
        backgroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView(
        children: const [
          HomeCard(cardText: "Set Schedule"),
          SizedBox(
            height: 5,
          ),
          HomeCard(cardText: "Add Exercise"),
        ],
      ),
    );
  }
}
