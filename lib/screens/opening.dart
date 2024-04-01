import 'package:flutter/material.dart';

class Opening extends StatefulWidget {
  const Opening({super.key});

  @override
  State<Opening> createState() => _OpeningState();
}

class _OpeningState extends State<Opening> {
  final strikerController = TextEditingController();
  final nonStrikerController = TextEditingController();
  final openingBowlerController = TextEditingController();
  bool isStrikerTapped = false;
  bool isStrikerEmpty = true;
  bool isNonStrikerTapped = false;
  bool isNonStrikerEmpty = true;
  bool isOpeningBowlerTapped = false;
  bool isOpeningBowlerEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Select Opening Players')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Card(
            elevation: 8,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                children: [
                  TextField(
                    controller: strikerController,
                    onTap: () {
                      setState(() {
                        isStrikerTapped = true;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        isStrikerEmpty = value.isEmpty;
                      });
                    },
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    maxLength: 20,
                    decoration: InputDecoration(
                      label: const Text(
                        'Striker',
                        style:
                            TextStyle(color: Color.fromARGB(255, 59, 124, 62)),
                      ),
                      hintText: 'Player name',
                      counterText: '',
                      errorText: isStrikerEmpty & isStrikerTapped
                          ? 'Player name cannot be empty'
                          : null,
                    ),
                  ),
                  TextField(
                    controller: nonStrikerController,
                    onTap: () {
                      setState(() {
                        isNonStrikerTapped = true;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        isNonStrikerEmpty = value.isEmpty;
                      });
                    },
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    maxLength: 20,
                    decoration: InputDecoration(
                      label: const Text(
                        'Non-striker',
                        style:
                            TextStyle(color: Color.fromARGB(255, 59, 124, 62)),
                      ),
                      hintText: 'Player name',
                      counterText: '',
                      errorText: isNonStrikerEmpty & isNonStrikerTapped
                          ? 'Player name cannot be empty'
                          : null,
                    ),
                  ),
                  TextField(
                    controller: openingBowlerController,
                    onTap: () {
                      setState(() {
                        isOpeningBowlerTapped = true;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        isOpeningBowlerEmpty = value.isEmpty;
                      });
                    },
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    maxLength: 20,
                    decoration: InputDecoration(
                      label: const Text(
                        'Opening bowler',
                        style:
                            TextStyle(color: Color.fromARGB(255, 59, 124, 62)),
                      ),
                      hintText: 'Player name',
                      counterText: '',
                      errorText: isOpeningBowlerEmpty & isOpeningBowlerTapped
                          ? 'Player name cannot be empty'
                          : null,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.redAccent,
                          ),
                          child: Text(
                            'Start Match',
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
