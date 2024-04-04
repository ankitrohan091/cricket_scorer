import 'package:flutter/material.dart';
import 'package:gully_cricket/database/sql_helper.dart';
import 'package:gully_cricket/models/teams_card.dart';
import 'package:gully_cricket/screens/player_list.dart';

class Team extends StatelessWidget {
  const Team({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      child: FutureBuilder<List<TeamsCard>>(
        future: SqlHelper.getTeams(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<TeamsCard> teams = snapshot.data!;
            if (teams.isEmpty) {
              return Center(
                child: Text(
                  'No Team is added!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            }
            return ListView.builder(
              itemCount: teams.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => MaterialPageRoute(builder: (ctx) {
                    int id = teams[index].id;
                    return PlayerList(teamId: id);
                  }),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black, width: 0.6),
                        borderRadius: BorderRadius.circular(6)),
                    elevation: 8,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 6),
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(teams[index].name),
                              Text('${teams[index].mathces}'),
                            ],
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Text('${teams[index].won}'),
                          Text('${teams[index].loss}'),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
