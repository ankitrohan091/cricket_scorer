import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gully_cricket/database/sql_helper.dart';
import 'package:gully_cricket/models/teams_card.dart';

class TeamNotifier extends StateNotifier<List<TeamsCard>> {
  TeamNotifier() : super([]) {
    fetchTeams();
  }
  Future<void> fetchTeams() async {
    state = await SqlHelper.getTeams();
  }

  Future<void> addTeam(TeamsCard team) async {
    state = [...state, team];
    await SqlHelper.addTeam(team: team);
  }

  Future<void> deleteTeam(String id) async {
    state = state.where((element) => element.id != id).toList();
    await SqlHelper.deleteTeam(id: id);
  }
}

final teamNotifierProvider =
    StateNotifierProvider<TeamNotifier, List<TeamsCard>>(
        (ref) => TeamNotifier());
