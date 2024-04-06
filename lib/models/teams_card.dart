import 'package:uuid/uuid.dart';

const uuid = Uuid();

class TeamsCard {
  final String name;
  final String shortName;
  final String id;
  final int mathces;
  final int won;
  final int loss;
  TeamsCard({required this.name, this.mathces = 0, this.won = 0, this.loss = 0})
      : shortName = name.substring(0, 2),
        id = uuid.v4();
  TeamsCard.add(
      {required this.id,
      required this.name,
      required this.mathces,
      required this.won,
      required this.loss})
      : shortName = name.substring(0, 2);
}
