import 'package:flutter/material.dart';

import '../widgets/home_card.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  TextEditingController _exerciseNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Page"),
      ),
      body: Column(
        children: [
          const Text(
            'Exercise Name:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5.0),
          TextField(
            controller: _exerciseNameController,
            decoration: const InputDecoration(
              hintText: 'Enter Exercise name',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
