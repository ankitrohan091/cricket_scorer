import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CircleIcon extends StatelessWidget {
  final String name;
  const CircleIcon({required this.name, super.key});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      radius: 14,
      child: Text(name),
    );
  }
}

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat("dd/MM/yyyy - hh:mm a");
    String today = formatter.format(DateTime.now());
    return Card(
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 0.6),
          borderRadius: BorderRadius.circular(6)),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      elevation: 8,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(today),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                CircleIcon(name: 'A'),
                SizedBox(width: 6),
                Text('Team name'),
                Spacer(),
                Text('Score Head'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                CircleIcon(name: 'B'),
                SizedBox(
                  width: 6,
                ),
                Text('Team name'),
                Spacer(),
                Text('Score Head')
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Team A won the toss and opted to Bat first.'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  child: const Text('Resume'),
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: Colors.black),
                    child: const Text('Scoreboard')),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.download_rounded)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete_sharp))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
