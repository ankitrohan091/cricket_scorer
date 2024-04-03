import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gully_cricket/screens/opening.dart';
import 'package:gully_cricket/util/error_dialog.dart';
import 'package:gully_cricket/util/name_validator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final teamAController = TextEditingController();
  final teamBController = TextEditingController();
  var overController = TextEditingController();
  bool validateA = true;
  bool validateB = true;
  bool isATapped = false;
  bool isBTapped = false;
  String? tossWinner;
  String? teamA;
  String? teamB;
  String? opted = 'Batting';

  @override
  Widget build(BuildContext context) {
    teamA = teamA == '' ? null : teamA;
    teamB = teamB == '' ? null : teamB;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: SingleChildScrollView(
          child: Column(children: [
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Teams',
                      style: TextStyle(
                          color: Color.fromARGB(255, 168, 67, 117),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    TextField(
                      textCapitalization: TextCapitalization.characters,
                      maxLength: 20,
                      keyboardType: TextInputType.name,
                      autofillHints: const [],
                      controller: teamAController,
                      decoration: InputDecoration(
                        errorText: isATapped & validateA
                            ? 'Please Enter Team name'
                            : null,
                        counterText: '',
                        hintText: "Team 'A'",
                      ),
                      onTap: () {
                        setState(() {
                          isATapped = true;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          teamA = value.toUpperCase();
                          validateA = teamAController.text.isEmpty;
                        });
                      },
                    ),
                    TextField(
                      textCapitalization: TextCapitalization.characters,
                      maxLength: 20,
                      keyboardType: TextInputType.name,
                      autofillHints: const [],
                      controller: teamBController,
                      decoration: InputDecoration(
                        errorText: isBTapped & validateB
                            ? 'Please Enter Team name'
                            : null,
                        counterText: '',
                        hintText: "Team 'B'",
                      ),
                      onTap: () {
                        setState(() {
                          isBTapped = true;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          teamB = value.toUpperCase();
                          validateB = teamBController.text.isEmpty;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Toss Winner?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 168, 67, 117),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                              title: Text(teamA ?? 'TeamA',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: const Color.fromARGB(
                                            255, 26, 90, 143),
                                        fontSize: 18,
                                      )),
                              value: teamA,
                              groupValue: tossWinner,
                              onChanged: (value) {
                                setState(() {
                                  tossWinner = value;
                                });
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              title: Text(teamB ?? 'Team B',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: const Color.fromARGB(
                                            255, 26, 90, 143),
                                        fontSize: 18,
                                      )),
                              value: teamB,
                              groupValue: tossWinner,
                              onChanged: (value) {
                                setState(() {
                                  tossWinner = value;
                                });
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Opted For?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 168, 67, 117),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                              title: Text('Batting',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: const Color.fromARGB(
                                            255, 26, 90, 143),
                                        fontSize: 18,
                                      )),
                              value: 'Batting',
                              groupValue: opted,
                              onChanged: (value) {
                                setState(() {
                                  opted = value;
                                });
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              title: Text('Bowling',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: const Color.fromARGB(
                                            255, 26, 90, 143),
                                        fontSize: 18,
                                      )),
                              value: 'Bowling',
                              groupValue: opted,
                              onChanged: (value) {
                                setState(() {
                                  opted = value;
                                });
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Overs?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 168, 67, 117),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    TextField(
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      autofillHints: const [],
                      controller: overController,
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: '8',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        teamAController.clear();
                        teamA = null;
                        teamB = null;
                        teamBController.clear();
                        overController.clear();
                        tossWinner = null;
                      });
                    },
                    child: const Text('Clear')),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (teamA == null || teamB == null) {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (ctx) => const ErrorDialog(
                                  title: 'Team name cannot be empty'));
                        });
                        return;
                      }
                      if (Validator.isInvalidName(teamA!) ||
                          Validator.isInvalidName(teamB!)) {
                        String whichTeam = Validator.isInvalidName(teamA!)
                            ? 'Team A'
                            : 'Team B';
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (ctx) =>
                                  ErrorDialog(title: '$whichTeam is Invalid'));
                        });
                        return;
                      }
                      if (tossWinner == null) {
                        setState(() {
                          showCupertinoDialog(
                              context: context,
                              builder: (ctx) {
                                return const ErrorDialog(
                                    title: 'Please Select Toss Winner');
                              });
                        });
                      } else {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return Opening(teamsName: [teamA!, teamB!]);
                        }));
                        tossWinner = null;
                      }
                    },
                    child: const Text('Start Match')),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
