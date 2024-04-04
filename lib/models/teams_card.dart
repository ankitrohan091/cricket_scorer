class TeamsCard {
  final String name;
  final String shortName;
  final int id;
  final int mathces;
  final int won;
  final int loss;
  TeamsCard(
      {required this.name,
      required this.id,
      required this.mathces,
      required this.won,
      required this.loss})
      : shortName = name.substring(0, 2);
}
