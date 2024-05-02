import 'package:flutter/material.dart';

class RecordCard extends StatelessWidget {
  final String title;
  final String number;
  const RecordCard({required this.title, required this.number, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Text(
              number,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
