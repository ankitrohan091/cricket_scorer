import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  const Team({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      child: Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 0.6),
            borderRadius: BorderRadius.circular(6)),
        elevation: 8,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                child: Text('A'),
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Team name'),
                  Text('Matches : 1'),
                ],
              ),
              const SizedBox(
                width: 1,
              ),
              const Text('Won: 0 '),
              const Text('Lost: 0 '),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
