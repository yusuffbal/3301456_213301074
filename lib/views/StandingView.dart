// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                      DataColumn(label: Text("LOGO")),
                      DataColumn(label: Text('TAKIM')),
                      DataColumn(label: Text('O')),
                      DataColumn(label: Text('G')),
                      DataColumn(label: Text('B')),
                      DataColumn(label: Text('M')),
                      DataColumn(label: Text('AV')),
                      DataColumn(label: Text('PUAN')),
                    ],
                    rows: _standings.map((standing) {
                      Widget crestWidget;

                      if (standing.crest.endsWith('.svg')) {
                        crestWidget = SvgPicture.network(
                          standing.crest,
                          width: 24, // SVG logonun genişliği
                          height: 24, // SVG logonun yüksekliği
                        );
                      } else if (standing.crest.endsWith('.png')) {
                        crestWidget = Image.network(
                          standing.crest,
                          width: 24, // PNG logonun genişliği
                          height: 24, // PNG logonun yüksekliği
                        );
                      } else {
                        // Geçerli bir format bulunamazsa boş bir widget
                        crestWidget = Container();
                      }

                      return DataRow(cells: [
                        DataCell(Text(standing.position.toString(),
                            textAlign: TextAlign.start)),
                        DataCell(crestWidget),
                        DataCell(Text(standing.teamName,
                            textAlign: TextAlign.start)),
                        DataCell(Text(standing.playedGames.toString(),
                            textAlign: TextAlign.start)),
                        DataCell(Text(standing.won.toString(),
                            textAlign: TextAlign.start)),
                        DataCell(Text(standing.draw.toString(),
                            textAlign: TextAlign.start)),
                        DataCell(Text(standing.lost.toString(),
                            textAlign: TextAlign.start)),
                        DataCell(Text(standing.goalDifference.toString(),
                            textAlign: TextAlign.start)),
                        DataCell(Text(standing.points.toString(),
                            textAlign: TextAlign.start)),
                      ]);
                    }).toList(),
                  ),
                ),
    );
  }
}
