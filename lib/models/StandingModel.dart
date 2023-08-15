// ignore_for_file: file_names

// Liglerin siralama verilerine erisim icin olusturulmus model class'i

class StandingModel {
  final int? id;
  final int position;
  final String teamName;
  final int playedGames;
  final int points;
  final int won;
  final int draw;
  final int lost;
  final int goalDifference;
  final String crest;

  //Constructor
  StandingModel({
    this.id,
    required this.position,
    required this.teamName,
    required this.playedGames,
    required this.points,
    required this.won,
    required this.draw,
    required this.lost,
    required this.goalDifference,
    required this.crest,
  });

}
