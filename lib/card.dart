import 'package:flutter/material.dart';

class ScoreWidget extends StatefulWidget {
  const ScoreWidget({super.key});

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

final dividerLine = Container(
  height: 1.5,
  width: 40,
  color: Colors.black,
);

class _ScoreWidgetState extends State<ScoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Table(
          children: const [
            TableRow(children: [
              Text('Team, 1st inning'),
              Text('CRR'),
            ]),
            TableRow(children: [
              Text('0 - 0 (0.0)'),
              Text('0.00'),
            ])
          ],
        ),
      ),
    );
  }
}

class BatsmanCard extends StatefulWidget {
  const BatsmanCard({super.key});
  @override
  State<BatsmanCard> createState() {
    return _BatsmanCardState();
  }
}

class _BatsmanCardState extends State<BatsmanCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Table(
          children: const [
            TableRow(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black))),
                children: [
                  Text('Batsman'),
                  Text('Run'),
                  Text('Ball'),
                  Text('4s'),
                  Text('6s'),
                  Text('SR'),
                ]),
            TableRow(children: [
              Text(
                'Batsman 1',
                maxLines: 1,
              ),
              Text('0'),
              Text('0'),
              Text('0'),
              Text('0'),
              Text('0'),
            ]),
            TableRow(children: [
              Text(
                'Batsman 2',
                maxLines: 1,
              ),
              Text('0'),
              Text('0'),
              Text('0'),
              Text('0'),
              Text('0'),
            ]),
          ],
        ),
      ),
    );
  }
}

class BowlerCard extends StatefulWidget {
  const BowlerCard({super.key});

  @override
  State<BowlerCard> createState() => _BowlerCardState();
}

class _BowlerCardState extends State<BowlerCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Table(
          children: const [
            TableRow(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black))),
                children: [
                  Text('Bowler'),
                  Text('Over'),
                  Text('M'),
                  Text('Run'),
                  Text('W'),
                  Text('ER')
                ]),
            TableRow(children: [
              Text(
                'Bowler name',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text('0.0'),
              Text('0'),
              Text('0'),
              Text('0'),
              Text('0'),
            ]),
          ],
        ),
      ),
    );
  }
}

class ThisOver extends StatefulWidget {
  const ThisOver({super.key});
  @override
  State<ThisOver> createState() {
    return _ThisOverState();
  }
}

class _ThisOverState extends State<ThisOver> {
  Widget ball({required String run, required Color color}) {
    return OutlinedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: color),
      child: Text(run),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Row(
          children: [
            const Text('This Over : '),
            Expanded(
              child: Row(
                children: [
                  ball(run: '0', color: Colors.white10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
