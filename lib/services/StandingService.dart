import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/StandingModel.dart';


class StandingService {
  final String apiKey = 'e11c9a34176f499bbd3ef7ef05458480';

  Future<List<StandingModel>> fetchStandings(String code) async {
    final url = Uri.parse('http://api.football-data.org/v4/competitions/$code/standings');
    final response = await http.get(url, headers: {'X-Auth-Token': apiKey});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final standingsData = data['standings'][0]['table'];
      print(response.body);

      final standings = List<StandingModel>.from(standingsData.map((standing) {
        return StandingModel(
          position: standing['position'],
          teamName: standing['team']['name'],
          playedGames: standing['playedGames'],
          points: standing['points'],
          won: standing['won'],
          draw: standing['draw'],
          lost: standing['lost'],
          goalDifference: standing['goalDifference']
        );
      }));

      return standings;
    } else {
      throw Exception('Sıralama Verileri Çekilemedi!');
    }
  }
}