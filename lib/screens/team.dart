import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gully_cricket/database/providers/team_provider.dart';
import 'package:gully_cricket/database/sql_helper.dart';
import 'package:gully_cricket/screens/player_list.dart';

class Team extends ConsumerWidget {
  List<String> getNames(String id) {
    List<String> list = [];
    SqlHelper.getPlayersName(id).then((value) => list = value);
    return list;
  }

  const Team({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teams = ref.watch(teamNotifierProvider);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
        child: ListView.builder(
          itemCount: teams.length,
          itemBuilder: (context, index) {
            if (teams.isEmpty) {
              return Center(
                child: Text(
                  'No Team is added!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => PlayerList(
                            list: getNames(teams[index].id),
                            teamName: teams[index].name,
                          )));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black, width: 0.6),
                      borderRadius: BorderRadius.circular(6)),
                  elevation: 8,
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          child: Text('A'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              teams[index].name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              children: [
                                const Text('Matches: '),
                                Text(
                                  '${teams[index].mathces}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Row(
                          children: [
                            const Text('Won: '),
                            Text(
                              '${teams[index].won}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Loss: '),
                            Text(
                              '${teams[index].loss}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              ref
                                  .read(teamNotifierProvider.notifier)
                                  .deleteTeam(teams[index].id);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ));
  }
}
