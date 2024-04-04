import 'package:flutter/material.dart';
import 'package:gully_cricket/database/sql_helper.dart';
import 'package:gully_cricket/screens/Home.dart';
import 'package:gully_cricket/screens/history.dart';
import 'package:gully_cricket/screens/team.dart';
import 'package:gully_cricket/util/name_validator.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final nameController = TextEditingController();
  bool isSubmitted = false;
  bool isEmpty = true;
  bool isInvalid = false;
  int _selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const Home();
    if (_selectedPageIndex == 0) {
      activePage = const Home();
    } else if (_selectedPageIndex == 1) {
      activePage =
          const Team(); //value is not updated we have to use provider for Teams
    } else if (_selectedPageIndex == 2) {
      activePage = const History();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gully Cricket'),
        backgroundColor: Colors.greenAccent,
      ),
      floatingActionButton: _selectedPageIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return StatefulBuilder(
                          builder: (ctxt, setState) {
                            return AlertDialog(
                              title: const Text('Create team'),
                              content: TextField(
                                controller: nameController,
                                maxLines: 1,
                                maxLength: 20,
                                decoration: InputDecoration(
                                  hintText: 'Enter team name',
                                  counterText: '',
                                  errorText: isSubmitted & isEmpty
                                      ? 'Team name cannot be empty!'
                                      : isSubmitted & isInvalid
                                          ? 'Team name is Invalid!'
                                          : null,
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      isSubmitted = false;
                                      Navigator.of(context).pop();
                                      nameController.clear();
                                    },
                                    child: const Text('Cancel')),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        isSubmitted = true;
                                        if (nameController.text.isEmpty) {
                                          isEmpty = true;
                                        } else if (Validator.isInvalidName(
                                            nameController.text)) {
                                          isEmpty = false;
                                          isInvalid = true;
                                        } else {
                                          SqlHelper.addTeam(
                                              teamName: nameController.text);
                                          isSubmitted = false;
                                          Navigator.of(context).pop();
                                          nameController.clear();
                                        }
                                      });
                                    },
                                    child: const Text('Ok'))
                              ],
                            );
                          },
                        );
                      });
                });
              },
              child: const Icon(Icons.add_circle_sharp),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_cricket_sharp), label: 'New Match'),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_3_sharp), label: 'Teams'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_toggle_off_sharp), label: 'History'),
        ],
      ),
      body: activePage,
    );
  }
}
