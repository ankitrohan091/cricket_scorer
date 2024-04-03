import 'package:flutter/material.dart';
import 'package:gully_cricket/screens/Home.dart';
import 'package:gully_cricket/screens/history.dart';
import 'package:gully_cricket/screens/team.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
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
      activePage = const Team();
    } else if (_selectedPageIndex == 2) {
      activePage = const History();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gully Cricket'),
        backgroundColor: Colors.greenAccent,
      ),
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
