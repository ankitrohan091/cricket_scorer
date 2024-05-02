import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gully_cricket/database/sql_helper.dart';
import 'package:gully_cricket/models/player.dart';
import 'package:gully_cricket/providers/player_provider.dart';
import 'package:gully_cricket/screens/player_record.dart';
import 'package:gully_cricket/util/name_validator.dart';
import 'package:uuid/uuid.dart';

class PlayerList extends ConsumerStatefulWidget {
  final String teamId;
  final String teamName;
  const PlayerList({required this.teamId, required this.teamName, super.key});

  @override
  ConsumerState<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends ConsumerState<PlayerList> {
  final nameController = TextEditingController();
  bool isSubmitted = false;
  bool isEmpty = true;
  bool isInvalid = false;
  @override
  Widget build(BuildContext context) {
    final players = ref.watch(playerNotifierProvider(widget.teamId));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.greenAccent,
        splashColor: Colors.black,
        elevation: 0,
        onPressed: () {
          setState(() {
            showDialog(
                context: context,
                builder: (ctx) {
                  return StatefulBuilder(builder: (ctx, setState) {
                    return AlertDialog(
                      title: const Text('Add Player'),
                      content: TextField(
                        controller: nameController,
                        maxLines: 1,
                        maxLength: 20,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          hintText: 'Enter player name',
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
                              Navigator.of(ctx).pop();
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
                                  ref
                                      .read(
                                          playerNotifierProvider(widget.teamId)
                                              .notifier)
                                      .addPlayer(Player.name(
                                          playerId: const Uuid().v4(),
                                          name: nameController.text,
                                          teamId: widget.teamId));
                                  isSubmitted = false;
                                  Navigator.of(ctx).pop();
                                  nameController.clear();
                                }
                              });
                            },
                            child: const Text('SAVE'))
                      ],
                    );
                  });
                });
          });
        },
        child: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
      appBar: AppBar(
        title: Text(widget.teamName),
      ),
      body: players.isEmpty
          ? const Center(
              child: Text(
                'Please Add Some Players!',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            )
          : ReorderableListView(
              onReorder: ((oldIndex, newIndex) {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                setState(() {
                  Player player = players.removeAt(oldIndex);
                  players.insert(newIndex, player);
                  SqlHelper.changeIndex(players);
                });
              }),
              children: players
                  .asMap()
                  .entries
                  .map((e) => buildCard(e.value, e.key))
                  .toList(),
            ),
    );
  }

  Widget buildCard(Player player, int index) {
    return Card(
        key: ValueKey(index),
        child: ListTile(
          key: ValueKey(player.playerId),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => Record(name: player.name))));
          },
          leading: const CircleAvatar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            child: Icon(Icons.person),
          ),
          title: Text(player.name),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            const SizedBox(
              width: 4,
            ),
            IconButton(
                onPressed: () {
                  ref
                      .read(playerNotifierProvider(widget.teamId).notifier)
                      .deletePlayer(player);
                },
                icon: const Icon(Icons.delete))
          ]),
        ));
  }
}
