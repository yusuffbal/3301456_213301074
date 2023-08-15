class LiveMatchModel {
  final String homeTeam;
  final String awayTeam;
  final String score;
  final String homeCrest;
  final String awayCrest;

  LiveMatchModel({
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
    required this.homeCrest, // homeCrest parametresini zorunlu hale getirdik
    required this.awayCrest, // awayCrest parametresini zorunlu hale getirdik
  });
}
