import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Player {
  final String playerId;
  final String name;
  final String teamId;
  final int matches;
  final int battingInning;
  final int ballFaced;
  final int runs;
  final int notOut;
  final String bestBatting;
  final double strikeRate;
  final double averageBatting;
  final int fours;
  final int sixes;
  final int thirty;
  final int fifty;
  final int hundred;
  final int ducks;
  final int bowlingInning;
  final double overs;
  final int maiden;
  final int wicket;
  final int runGiven;
  final String bestBowling;
  final double economyRate;
  final double averageBowling;
  final int wides;
  final int noBall;
  final int dotBalled;
  final int threeWickets;
  final int fiveWickets;
  final int catches;
  final int stumping;
  final int runOut;

  Player(
      {required this.playerId,
      required this.name,
      required this.teamId,
      required this.matches,
      required this.battingInning,
      required this.bestBatting,
      required this.ballFaced,
      required this.runs,
      required this.notOut,
      required this.fours,
      required this.sixes,
      required this.thirty,
      required this.fifty,
      required this.hundred,
      required this.ducks,
      required this.bowlingInning,
      required this.overs,
      required this.maiden,
      required this.wicket,
      required this.runGiven,
      required this.bestBowling,
      required this.wides,
      required this.noBall,
      required this.dotBalled,
      required this.threeWickets,
      required this.fiveWickets,
      required this.catches,
      required this.stumping,
      required this.runOut})
      : strikeRate = battingInning == 0 ? 0.0 : (runs / ballFaced) * 100,
        averageBatting =
            battingInning == notOut ? 0.0 : runs / (battingInning - notOut),
        economyRate = bowlingInning == 0 ? 0.0 : runGiven / overs,
        averageBowling = wicket == 0 ? 0.0 : runGiven / wicket;

  Player.name(
      {required this.name,
      required this.teamId,
      this.matches = 0,
      this.battingInning = 0,
      this.bestBatting = '_', //temporary
      this.ballFaced = 0,
      this.runs = 0,
      this.notOut = 0,
      this.fours = 0,
      this.sixes = 0,
      this.thirty = 0,
      this.fifty = 0,
      this.hundred = 0,
      this.ducks = 0,
      this.bowlingInning = 0,
      this.overs = 0.0,
      this.maiden = 0,
      this.wicket = 0,
      this.runGiven = 0,
      this.bestBowling = '_', //temporary
      this.wides = 0,
      this.noBall = 0,
      this.dotBalled = 0,
      this.threeWickets = 0,
      this.fiveWickets = 0,
      this.catches = 0,
      this.stumping = 0,
      this.runOut = 0})
      : playerId = uuid.v4(),
        strikeRate = battingInning == 0 ? 0.0 : (runs / ballFaced) * 100,
        averageBatting =
            battingInning == notOut ? 0.0 : runs / (battingInning - notOut),
        economyRate = bowlingInning == 0 ? 0.0 : runGiven / overs,
        averageBowling = wicket == 0 ? 0.0 : runGiven / wicket;

  Map<String, dynamic> toMap() {
    return {
      'Player_id': playerId,
      'Player_name': name,
      'Team_id': teamId,
      'Matches': matches,
      'Batting_inning': battingInning,
      'Ball_faced': ballFaced,
      'Runs': runs,
      'Not_out': notOut,
      'Best_batting': bestBatting,
      'Fours': fours,
      'Sixes': sixes,
      'Thirty': thirty,
      'Fifty': fifty,
      'Hundred': hundred,
      'Ducks': ducks,
      'Bowling_inning': bowlingInning,
      'Overs': overs,
      'Maiden': maiden,
      'Wicket': wicket,
      'Run_given': runGiven,
      'Best_bowling': bestBowling,
      'Wides': wides,
      'No_ball': noBall,
      'Dot_balled': dotBalled,
      'Three_wickets': threeWickets,
      'Five_wickets': fiveWickets,
      'Catches': catches,
      'Stumping': stumping,
      'Run_out': runOut,
    };
  }
}
