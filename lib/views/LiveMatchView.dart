import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footballapp_2/constants/constant.dart';
import 'package:footballapp_2/models/LiveMatchModel.dart';
import '../services/LiveMatchService.dart';

class LiveMatchScreen extends StatefulWidget {
  final LiveMatchService service;

  const LiveMatchScreen({Key? key, required this.service}) : super(key: key);

  @override
  _LiveMatchScreenState createState() => _LiveMatchScreenState();
}

class _LiveMatchScreenState extends State<LiveMatchScreen> {
  List<LiveMatchModel> _matches = [];

  @override
  void initState() {
    super.initState();
    fetchLiveMatches();
  }

  Future<void> fetchLiveMatches() async {
    try {
      final matches = await widget.service.fetchLiveMatches();
      setState(() {
        _matches = matches;
      });
    } catch (error) {
      // ignore: avoid_print
      print('Maç Verileri Çekilemedi $error');
    }
  }

  String shortenTeamName(String teamName) {
    if (teamName.length > 10) {
      return teamName.substring(0, 10) + '..';
    }
    return teamName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.mavi3,
      body: _matches.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _matches.length,
              itemBuilder: (context, index) {
                final match = _matches[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(0.4), // Home Team Crest
                        1: FlexColumnWidth(0.7), // Home Team Name
                        2: FlexColumnWidth(0.4), // Score
                        3: FlexColumnWidth(0.7), // Away Team Name
                        4: FlexColumnWidth(0.4), // Away Team Crest
                      },
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: match.homeCrest.endsWith('.svg')
                                  ? SvgPicture.network(
                                      match.homeCrest,
                                      height: 35,
                                      width: 35,
                                      fit: BoxFit.fill,
                                    ) // SVG formatında ise SVG olarak işle
                                  : Image.network(
                                      match.homeCrest,
                                      height: 35,
                                      width: 35,
                                      fit: BoxFit.fill,
                                    ), // PNG formatında ise PNG olarak işle
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  shortenTeamName(match.homeTeam),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  '${match.score}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  shortenTeamName(match.awayTeam),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: match.awayCrest.endsWith('.svg')
                                  ? SvgPicture.network(
                                      match.awayCrest,
                                      height: 35,
                                      width: 35,
                                      fit: BoxFit.fill,
                                    ) // SVG formatında ise SVG olarak işle
                                  : Image.network(
                                      match.awayCrest,
                                      height: 35,
                                      width: 35,
                                      fit: BoxFit.fill,
                                    ), // PNG formatında ise PNG olarak işle
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
