import 'package:gully_cricket/models/player.dart';
import 'package:gully_cricket/models/teams_card.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlHelper {
  static Future<void> createTable(Database database) async {
    await database.execute('PRAGMA foreign_keys = ON;');

    await database.execute('''CREATE TABLE Teams(
            Team_id TEXT PRIMARY KEY, 
            Team_name TEXT NOT NULL,
            Played_match INTEGER NOT NULL DEFAULT 0,
            Won INTEGER NOT NULL DEFAULT 0,
            Loss INTEGER NOT NULL DEFAULT 0
        )''');

    await database.execute('''CREATE TABLE Player(
      Player_id TEXT PRIMARY KEY,
      Player_name TEXT NOT NULL,
      Team_id TEXT NOT NULL,
      Matches INTEGER NOT NULL DEFAULT 0,
      Batting_inning INTEGER NOT NULL DEFAULT 0,
      Ball_faced INTEGER NOT NULL DEFAULT 0,
      Runs INTEGER NOT NULL DEFAULT 0,
      Not_out INTEGER NOT NULL DEFAULT 0,
      Best_batting TEXT,
      Fours INTEGER NOT NULL DEFAULT 0,
      Sixes INTEGER NOT NULL DEFAULT 0,
      Thirty INTEGER NOT NULL DEFAULT 0,
      Fifty INTEGER NOT NULL DEFAULT 0,
      Hundred INTEGER NOT NULL DEFAULT 0,
      Ducks INTEGER NOT NULL DEFAULT 0,
      Bowling_inning INTEGER NOT NULL DEFAULT 0,
      Overs DOUBLE NOT NULL DEFAULT 0.0,
      Maiden INTEGER NOT NULL DEFAULT 0,
      Wicket INTEGER NOT NULL DEFAULT 0,
      Run_given INTEGER NOT NULL DEFAULT 0,
      Best_bowling TEXT,
      Wides INTEGER NOT NULL DEFAULT 0,
      No_ball INTEGER NOT NULL DEFAULT 0,
      Dot_balled INTEGER NOT NULL DEFAULT 0,
      Three_wickets INTEGER NOT NULL DEFAULT 0,
      Five_wickets INTEGER NOT NULL DEFAULT 0,
      Catches INTEGER NOT NULL DEFAULT 0,
      Stumping INTEGER NOT NULL DEFAULT 0,
      Run_out INTEGER NOT NULL DEFAULT 0,
      FOREIGN KEY(Team_id) REFERENCES Teams(Team_id) ON DELETE CASCADE ON UPDATE CASCADE
    )''');
  }

  static Future<Database> openingDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'gully_cricket.db');
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: ((db, version) {
        createTable(db);
      }),
    );
    return db;
  }

  static Future<List<Player>> getPlayersName(String teamId) async {
    final db = await openingDatabase();
    final List<Map<String, dynamic>> names = await db.rawQuery(
        'SELECT Player_name,Player_id FROM Player WHERE Team_id=?', [teamId]);
    List<Player> namesList = [];
    for (final name in names) {
      namesList.add(Player.name(
          name: name['Player_name'],
          playerId: name['Player_id'],
          teamId: teamId));
    }
    return namesList;
  }

  static Future<List<TeamsCard>> getTeams() async {
    final db = await openingDatabase();
    final List<Map<String, dynamic>> teams =
        await db.rawQuery('SELECT * FROM Teams');
    return List.generate(teams.length, (index) {
      return TeamsCard.add(
          id: teams[index]['Team_id'],
          name: teams[index]['Team_name'],
          mathces: teams[index]['Played_match'],
          won: teams[index]['Won'],
          loss: teams[index]['Loss']);
    });
  }

  static Future<void> addTeam({required TeamsCard team}) async {
    final db = await openingDatabase();
    await db.rawInsert('INSERT INTO Teams(Team_name,Team_id) VALUES (?,?)',
        [team.name, team.id]);
  }

  static Future<void> deleteTeam({required String id}) async {
    final db = await openingDatabase();
    await db.rawDelete('DELETE FROM Teams WHERE Team_id=?', [id]);
  }

  static Future<void> addPlayer({required Player player}) async {
    final db = await openingDatabase();
    await db.rawInsert(
      'INSERT INTO Player('
      'Player_id, Player_name, Team_id, Matches, Batting_inning, Ball_faced, Runs, '
      'Not_out, Best_batting, Fours, Sixes, Thirty, Fifty, Hundred, Ducks, '
      'Bowling_inning, Overs, Maiden, Wicket, Run_given, Best_bowling, '
      'Wides, No_ball, Dot_balled, Three_wickets, Five_wickets, Catches, '
      'Stumping, Run_out) '
      'VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        player.playerId,
        player.name,
        player.teamId,
        player.matches,
        player.battingInning,
        player.ballFaced,
        player.runs,
        player.notOut,
        player.bestBatting,
        player.fours,
        player.sixes,
        player.thirty,
        player.fifty,
        player.hundred,
        player.ducks,
        player.bowlingInning,
        player.overs,
        player.maiden,
        player.wicket,
        player.runGiven,
        player.bestBowling,
        player.wides,
        player.noBall,
        player.dotBalled,
        player.threeWickets,
        player.fiveWickets,
        player.catches,
        player.stumping,
        player.runOut,
      ],
    );
  }

  static Future<void> deletePlayer({required String playerId}) async {
    final db = await openingDatabase();
    await db.delete('Player', where: 'Player_id = ?', whereArgs: [playerId]);
  }
}
