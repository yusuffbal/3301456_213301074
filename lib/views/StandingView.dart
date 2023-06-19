import 'package:flutter/material.dart';


import '../models/StandingModel.dart';
import '../services/StandingService.dart';

class StandingView extends StatefulWidget {
  final String code;

  const StandingView({required this.code});

  @override
  _StandingViewState createState() => _StandingViewState();
}

class _StandingViewState extends State<StandingView> {
  final StandingService _service = StandingService();
  List<StandingModel> _standings = [];

  @override
  void initState() {
    super.initState();
    fetchStandings();
  }

  Future<void> fetchStandings() async {
    try {
      final standings = await _service.fetchStandings(widget.code);
      setState(() {
        _standings = standings;
      });
    } catch (error) {
      print('Error fetching standings: $error');
      // veya
      // Hata iletisi gösterme veya diğer hata yönetimi adımlarını buraya ekleyin
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puan Tablosu'),
        backgroundColor: Color.fromARGB(255, 55, 19, 103)
      ),
      body: _standings.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: DataTable(
                columnSpacing: 10.0,
                columns: const [
                  DataColumn(label: Text('#')),
                  DataColumn(label: Text('TAKIM')),
                  DataColumn(label: Text('O')),
                  DataColumn(label: Text('G')),
                  DataColumn(label: Text('B')),
                  DataColumn(label: Text('M')),
                  DataColumn(label: Text('AV')),
                  DataColumn(label: Text('PUAN')),
                ],
                rows: _standings.map((standing) {
                  return DataRow(cells: [
                    DataCell(Text(standing.position.toString())),
                    DataCell(Text(standing.teamName)),
                    DataCell(Text(standing.playedGames.toString())),
                    DataCell(Text(standing.won.toString())),
                    DataCell(Text(standing.draw.toString())),
                    DataCell(Text(standing.lost.toString())),
                    DataCell(Text(standing.goalDifference.toString())),
                    DataCell(Text(standing.points.toString())),
                  ]);
                }).toList(),
              ),
            ),
    );
  }
}