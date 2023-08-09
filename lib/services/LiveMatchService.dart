// ignore_for_file: avoid_print, file_names

import 'package:http/http.dart' as http;
import 'dart:convert';


import '../models/LiveMatchModel.dart';

class LiveMatchService {
  final String apiKey = 'e11c9a34176f499bbd3ef7ef05458480';

  Future<List<LiveMatchModel>> fetchLiveMatches() async {
    final url = Uri.parse('http://api.football-data.org/v4/matches');
    final response = await http.get(url, headers: {'X-Auth-Token': apiKey});

    // Gunun maclarinin verilerine ulasmak icin adrese http istegi atilir.

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final matchesData = data['matches'];

      // Http istegi basariliysa apiden gelen json verileri matchesdata degiskenine atar.

      final matches = List<LiveMatchModel>.from(matchesData.map((match) {
        return LiveMatchModel(
          homeTeam: match['homeTeam']['name'],
          awayTeam: match['awayTeam']['name'],
          score: '${match['score']['fullTime']['homeTeam']} - ${match['score']['fullTime']['awayTeam']}',
        );
      }));
      return matches;

            // matchesData icerisindeki verileri matchmodel sinifindan olusturulan bir nesneye atar ve onu dondurur.

    } else {
      throw Exception('Günün Maçlarının Verileri Çekilemedi!');
    }
  }
}