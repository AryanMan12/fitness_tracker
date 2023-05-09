import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({super.key});

  @override
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  final TextEditingController _exerciseNameController = TextEditingController();

  final List<String> _items = ["Hello", "World", "ABc"];
  String dropdownValue = "";

  @override
  void initState() {
    super.initState();
    dropdownValue = _items.first;
  }

  addExercise(String text, String dropdownValue) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Exercise"),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: secBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Exercise Name:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _exerciseNameController,
              decoration: const InputDecoration(
                hintText: 'Enter Exercise name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                const Text(
                  'For:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                DropdownButton(
                  value: dropdownValue,
                  underline: Container(
                    height: 2,
                    color: Colors.blueGrey,
                  ),
                  items: _items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => addExercise(
                  _exerciseNameController.text,
                  dropdownValue,
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
