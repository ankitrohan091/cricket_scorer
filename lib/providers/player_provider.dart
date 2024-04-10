import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gully_cricket/database/sql_helper.dart';
import 'package:gully_cricket/models/player.dart';

class PlayerNotifier extends StateNotifier<List<Player>> {
  final String teamId;
  PlayerNotifier({required this.teamId}) : super([]) {
    fetchPlayers();
  }

  Future<void> fetchPlayers() async {
    state = await SqlHelper.getPlayersName(teamId);
  }

  Future<void> addPlayer(Player player) async {
    state = [...state, player];
    SqlHelper.addPlayer(player: player);
  }

  Future<void> deletePlayer(Player player) async {
    state =
        state.where((element) => element.playerId != player.playerId).toList();
    SqlHelper.deletePlayer(playerId: player.playerId);
  }
}

final playerNotifierProvider =
    StateNotifierProvider.family<PlayerNotifier, List<Player>, String>(
        (ref, teamId) => PlayerNotifier(teamId: teamId));
