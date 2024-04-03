import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  const ErrorDialog({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Okay'))
      ],
    );
  }
}
