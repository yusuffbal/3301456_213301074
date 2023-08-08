// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:footballapp_2/constants/constant.dart';

import '../models/StandingModel.dart';
import '../services/StandingService.dart';

class StandingView extends StatefulWidget {
  final String code;

  const StandingView({super.key, required this.code});

  @override
  // ignore: library_private_types_in_public_api
  _StandingViewState createState() => _StandingViewState();
}

class _StandingViewState extends State<StandingView> {
  final StandingService _service = StandingService();
  List<StandingModel> _standings = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final apiStandings = await _service.fetchStandings(widget.code);

      setState(() {
        _standings = apiStandings;
        _isLoading = false;
      });

    } catch (error) {
      // ignore: avoid_print
      print('Sıralama verileri çekilemedi $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puan Tablosu'),
        backgroundColor: constant.mavi1,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _standings.isEmpty
              ? const Center(child: Text('Veri bulunamadı'))
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
