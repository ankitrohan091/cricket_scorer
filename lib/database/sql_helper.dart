import 'package:gully_cricket/models/teams_card.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlHelper {
  static Future<void> createTable(Database database) async {
    await database.execute('PRAGMA foreign_keys = ON;');

    await database.execute('''CREATE TABLE Teams(
            Team_id INTEGER PRIMARY KEY AUTOINCREMENT, 
            Team_name TEXT NOT NULL,
            Played_match INTEGER NOT NULL DEFAULT 0,
            Won INTEGER NOT NULL DEFAULT 0,
            Loss INTEGER NOT NULL DEFAULT 0
        )''');

    await database.execute('''CREATE TABLE Player(
      Player_id INTEGER PRIMARY KEY AUTOINCREMENT,
      Player_name TEXT NOT NULL,
      Team_id INTEGER NOT NULL,
      Matches INTEGER NOT NULL DEFAULT 0,
      Batting_inning INTEGER NOT NULL DEFAULT 0,
      Ball_faced INTEGER NOT NULL DEFAULT 0,
      Runs INTEGER NOT NULL DEFAULT 0,
      Not_out INTEGER NOT NULL DEFAULT 0,
      Best_batting TEXT,
      Strike_rate DOUBLE NOT NULL DEFAULT 0.0,
      Average_batting DOUBLE NOT NULL DEFAULT 0.0,
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
      Economy_rate DOUBLE NOT NULL DEFAULT 0.0,
      Average_bowling DOUBLE NOT NULL DEFAULT 0.0,
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

  static Future<List<String>> getPlayerName(int teamId) async {
    final db = await openingDatabase();
    final List<Map<String, dynamic>> names = await db
        .rawQuery('SELECT Player_name FROM Player WHERE Team_id=?', [teamId]);
    List<String> namesList = [];
    for (final name in names) {
      namesList.add(name['Player_name']);
    }
    return namesList;
  }

  static Future<List<TeamsCard>> getTeams() async {
    final db = await openingDatabase();
    final List<Map<String, dynamic>> teams =
        await db.rawQuery('SELECT * FROM Teams');
    return List.generate(teams.length, (index) {
      return TeamsCard(
          id: teams[index]['Team_id'],
          name: teams[index]['Team_name'],
          mathces: teams[index]['Matches'],
          won: teams[index]['Won'],
          loss: teams[index]['Loss']);
    });
  }

  static Future<void> addTeam({required String teamName}) async {
    final db = await openingDatabase();
    await db.rawInsert('INSERT INTO Teams(Team_name) VALUES (?)', [teamName]);
  }
}