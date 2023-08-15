import 'dart:convert';

import '../models/LiveMatchModel.dart';
import 'package:http/http.dart' as http;

class LiveMatchService {
  final String apiKey = 'e11c9a34176f499bbd3ef7ef05458480';

  Future<List<LiveMatchModel>> fetchLiveMatches() async {
    final url = Uri.parse('http://api.football-data.org/v4/matches');
    final response = await http.get(url, headers: {'X-Auth-Token': apiKey});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final matchesData = data['matches'];

      final matches = List<LiveMatchModel>.from(matchesData.map((match) {
        final homeTeamName = match['homeTeam']['name'];
        final awayTeamName = match['awayTeam']['name'];

        final homeTeamCrest = match['homeTeam']['crest'] ?? ''; 
        final awayTeamCrest = match['awayTeam']['crest'] ?? ''; 
      
        final homeScoreData = match['score']['fullTime']['homeTeam'];
        final awayScoreData = match['score']['fullTime']['awayTeam'];

        final homeScore = homeScoreData != null ? homeScoreData.toString() : '0';
        final awayScore = awayScoreData != null ? awayScoreData.toString() : '0';

        return LiveMatchModel(
          homeTeam: homeTeamName,
          awayTeam: awayTeamName,
          score: '$homeScore - $awayScore', 
          homeCrest: homeTeamCrest, 
          awayCrest: awayTeamCrest,
        );
      }));
      return matches;
    } else {
      throw Exception('Günün Maçlarının Verileri Çekilemedi!');
    }
  }
}
