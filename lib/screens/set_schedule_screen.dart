import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class SetScheduleScreen extends StatefulWidget {
  const SetScheduleScreen({super.key});

  @override
  State<SetScheduleScreen> createState() => _SetScheduleScreenState();
}

class _SetScheduleScreenState extends State<SetScheduleScreen> {
  List<String> items = ["Hello", "World", "hii"];
  List<MultiSelectItem> _items = [];
  @override
  void initState() {
    super.initState();
    _items = items.map((name) => MultiSelectItem<String>(name, name)).toList();
  }

  List _monday = [];
  List _tuesday = [];
  List _wednesday = [];
  List _thursday = [];
  List _friday = [];
  List _saturday = [];

  void _showMultiSelect(BuildContext context, List _selectedVals) async {
    await showModalBottomSheet(
      isScrollControlled: true, // required for min/max child size
      context: context,
      builder: (ctx) {
        return MultiSelectBottomSheet(
          items: _items,
          initialValue: _selectedVals,
          onConfirm: (values) {
            setState(() {
              for (int i = 0; i < values.length; i++){
                _selectedVals.add(values[i]);
              }
            });
          },
          maxChildSize: 0.8,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Set Schedule")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Text("Monday:"),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () => _showMultiSelect(context, _monday),
                  child: const Text("Add"),
                ),
                Text(_monday.toString()),
              ],
            ),
            Row(
              children: [
                const Text("Tuesday:"),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () => _showMultiSelect(context, _tuesday),
                  child: const Text("Add"),
                ),
                Text(_tuesday.toString()),
              ],
            ),
            Row(
              children: [
                const Text("Wednesday:"),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () => _showMultiSelect(context, _wednesday),
                  child: const Text("Add"),
                ),
                Text(_wednesday.toString()),
              ],
            ),
            Row(
              children: [
                const Text("Thursday:"),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () => _showMultiSelect(context, _thursday),
                  child: const Text("Add"),
                ),
                Text(_thursday.toString()),
              ],
            ),
            Row(
              children: [
                const Text("Friday:"),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () => _showMultiSelect(context, _friday),
                  child: const Text("Add"),
                ),
                Text(_friday.toString()),
              ],
            ),
            Row(
              children: [
                const Text("Saturday:"),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () => _showMultiSelect(context, _saturday),
                  child: const Text("Add"),
                ),
                Text(_saturday.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
