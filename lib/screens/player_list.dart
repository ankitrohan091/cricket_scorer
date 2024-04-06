import 'package:flutter/material.dart';

class PlayerList extends StatefulWidget {
  final List<String> list;
  final String teamName;
  const PlayerList({required this.list, required this.teamName, super.key});

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.teamName),
      ),
      body: ReorderableListView(
        onReorder: ((oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final player = widget.list.removeAt(oldIndex);
            widget.list.insert(newIndex, player);
          });
        }),
        children: widget.list.map((e) => buildCard(e)).toList(),
      ),
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
