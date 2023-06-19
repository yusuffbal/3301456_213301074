class StandingModel {
  final int position;
  final String teamName;
  final int playedGames;
  final int points;
  final int won;
  final int draw;
  final int lost;
  final int goalDifference;
 

  StandingModel(
   {
    required this.won,
    required this.draw,
    required this.lost,
    required this.goalDifference,
    required this.position,
    required this.teamName,
    required this.playedGames,
    required this.points,
  });
}