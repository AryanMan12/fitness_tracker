import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final cardText;
  const HomeCard({
    super.key,
    required this.cardText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 5,
      margin: const EdgeInsets.all(10),
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: InkWell(
        onTap: () {},
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
