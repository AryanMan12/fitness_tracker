import 'package:exercise_tracker/screens/add_data_screen.dart';
import 'package:exercise_tracker/screens/admin_screen.dart';
import 'package:exercise_tracker/screens/view_data_screen.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String cardText;
  const HomeCard({
    super.key,
    required this.cardText,
  });

  void _goToScreen(String pageName, BuildContext context) {
    if (pageName.compareTo("Add Today's Data") == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const AddDataScreen()));
    } else if (pageName.compareTo("View Data") == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ViewData()));
    } else if (pageName.compareTo("Add Meta Data") == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const AdminScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 5,
      margin: const EdgeInsets.all(10),
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: InkWell(
        onTap: () => _goToScreen(cardText, context),
        child: SizedBox(
            height: 80,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Text(
                  cardText,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                )))),
      ),
    );
  }
}
