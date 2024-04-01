import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlHelper {
  static Future<void> createTable(Database database, String team1) async {
    await database.execute("""CREATE TABLE $team1(
      player_name Text not null,
      run FLOAT ,
      wicket INTEGER
    )""");
  }

  static Future<Database> openingDatabase() async {
    var databasePath=await getDatabasesPath();
    String path=join(databasePath,'cricket_scorer.db');
    Database db=await openDatabase(path,version: 1,
    onCreate: ((db, version) {
      createTable(db, 'team1');
    }),
    );
    return db;
  }
}
