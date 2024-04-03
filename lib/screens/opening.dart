import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gully_cricket/screens/score_detail.dart';
import 'package:gully_cricket/util/error_dialog.dart';
import 'package:gully_cricket/util/name_validator.dart';

class Opening extends StatefulWidget {
  final List<String> teamsName;
  const Opening({required this.teamsName, super.key});

  @override
  State<Opening> createState() => _OpeningState();
}

class _OpeningState extends State<Opening> {
  final strikerController = TextEditingController();
  final nonStrikerController = TextEditingController();
  final openingBowlerController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
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
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter Striker name';
                        }
                        return null;
                      },
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.name,
                      maxLength: 20,
                      decoration: InputDecoration(
                        label: const Text(
                          'Striker',
                          style: TextStyle(
                              color: Color.fromARGB(255, 59, 124, 62)),
                        ),
                        hintText: 'Player name',
                        counterText: '',
                        errorText: isStrikerEmpty & isStrikerTapped
                            ? 'Player name cannot be empty'
                            : null,
                      ),
                    ),
                    TextFormField(
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 59, 124, 62)),
                        ),
                        hintText: 'Player name',
                        counterText: '',
                        errorText: isNonStrikerEmpty & isNonStrikerTapped
                            ? 'Player name cannot be empty'
                            : null,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter Non-striker name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 59, 124, 62)),
                        ),
                        hintText: 'Player name',
                        counterText: '',
                        errorText: isOpeningBowlerEmpty & isOpeningBowlerTapped
                            ? 'Player name cannot be empty'
                            : null,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter Opening Bowler name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? true) {
                                if (Validator.isInvalidName(
                                        strikerController.text) ||
                                    Validator.isInvalidName(
                                        nonStrikerController.text) ||
                                    Validator.isInvalidName(
                                        openingBowlerController.text)) {
                                  String whichName = Validator.isInvalidName(
                                          strikerController.text)
                                      ? 'Striker'
                                      : Validator.isInvalidName(
                                              nonStrikerController.text)
                                          ? 'Non-striker'
                                          : 'Opening-bowler';
                                  showCupertinoDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return ErrorDialog(
                                            title:
                                                'Please enter valid $whichName name');
                                      });
                                } else {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (ctx) {
                                    return ScoreDetail(
                                      appBarTitle:
                                          '${widget.teamsName[0]} v/s ${widget.teamsName[1]}',
                                    );
                                  }));
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                              foregroundColor: Colors.redAccent,
                            ),
                            child: Text(
                              'Start Match',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
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
          ),
        ));
  }
}
