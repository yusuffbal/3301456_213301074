// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/StandingModel.dart';


class StandingService {
  final String apiKey = 'e11c9a34176f499bbd3ef7ef05458480';

  Future<List<StandingModel>> fetchStandings(String code) async {
    final url = Uri.parse('http://api.football-data.org/v4/competitions/$code/standings');
    final response = await http.get(url, headers: {'X-Auth-Token': apiKey});
    //gelen cevap response degiskenine atanir.

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final standingsData = data['standings'][0]['table'];
      //eger istek basarili olduysa gelen veriler standingsdata degiskenine aktarilir.

      final standings = List<StandingModel>.from(standingsData.map((standing) {
        return StandingModel(
          position: standing['position'],
          id: standing['team']['id'],
          teamName: standing['team']['name'],
          playedGames: standing['playedGames'],
          points: standing['points'],
          won: standing['won'],
          draw: standing['draw'],
          lost: standing['lost'],
          goalDifference: standing['goalDifference'], 
          crest: standing['team']['crest'],
          //standingsdata degiskenine aktarilan datalar StandingModel classinda olusturulan veri modeline aktarilir ve o siniftan bir nesne dondurulur.
        );
      }));


      return standings;
    } else {
      throw Exception('Sıralama Verileri Çekilemedi!');
    }
  }
}
