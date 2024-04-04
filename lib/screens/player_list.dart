import 'package:flutter/material.dart';
import 'package:gully_cricket/database/sql_helper.dart';

class PlayerList extends StatefulWidget {
  final int teamId;
  const PlayerList({required this.teamId, super.key});

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  late List<String> list;

  Future<void> getPlayers() async {
    list = await SqlHelper.getPlayerName(widget.teamId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: ((oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final player = list.removeAt(oldIndex);
          list.insert(newIndex, player);
        });
      }),
      children: list.map((e) => buildCard(e)).toList(),
    );
  }

  Widget buildCard(String name) {
    return Card(
      elevation: 8,
      child: Row(
        children: [
          const CircleAvatar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            child: Icon(Icons.person),
          ),
          Text(name),
        ],
      ),
    );
  }
}
