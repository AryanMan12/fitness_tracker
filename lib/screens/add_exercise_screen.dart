import 'package:flutter/material.dart';
import 'package:exercise_tracker/providers/type_provider.dart';
import 'package:exercise_tracker/models/type.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';
import 'package:logger/logger.dart';

import '../utils/colors.dart';

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({super.key});

  @override
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  final TextEditingController _exerciseNameController = TextEditingController();
  List<ExerciseType>? _items = [];
  int dropdownValue = 0;

  @override
  void initState()  {
    super.initState();
    initData();
  }

  initData() async{
    final Database db = await Modular.getAsync<Database>();

    final TypeProvider typeProvider = TypeProvider(db: db);
    _items = await typeProvider.getAllExerciseTypes();

    dropdownValue = _items!.first.id!;
  }

  addExercise(String text, int dropdownValue) {}

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d(_items);
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
                  DropdownButton<int>(
                    value: dropdownValue,
                    underline: Container(
                      height: 2,
                      color: Colors.blueGrey,
                    ),
                    items: _items!.map<DropdownMenuItem<int>>((ExerciseType value) {
                      logger.d(value.name);
                      return DropdownMenuItem<int>(
                        value: value.id,
                        child: Text(value.name),
                      );
                    }).toList(),
                    onChanged: (int? value) {
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
