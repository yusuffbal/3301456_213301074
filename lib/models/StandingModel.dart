// ignore_for_file: file_names

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
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'position': position,
      'teamName': teamName,
      'playedGames': playedGames,
      'points': points,
      'won': won,
      'draw': draw,
      'lost': lost,
      'goalDifference': goalDifference,
    };
  }

  static StandingModel fromMap(Map<String, dynamic> map) {
    return StandingModel(
      id: map['id'],
      position: map['position'],
      teamName: map['teamName'],
      playedGames: map['playedGames'],
      points: map['points'],
      won: map['won'],
      draw: map['draw'],
      lost: map['lost'],
      goalDifference: map['goalDifference'],
    );
  }
}
