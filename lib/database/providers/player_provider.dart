import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gully_cricket/database/sql_helper.dart';
import 'package:gully_cricket/models/player.dart';

class PlayerNotifier extends StateNotifier {
  final String teamId;
  PlayerNotifier({required this.teamId}) : super([]) {
    fetchPlayers();
  }

  Future<void> fetchPlayers() async {
    state = await SqlHelper.getPlayersName(teamId);
  }

  Future<void> addPlayer(Player player) async {
    state = [...state, player.name];
  }

  Future<void> deletePlayer(Player player) async {
    state = state.where((element) {
      element = player.name;
    });
  }
}
