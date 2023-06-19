import 'package:flutter/material.dart';

import '../models/LiveMatchModel.dart';
import '../services/LiveMatchService.dart';

class LiveMatchScreen extends StatefulWidget {
  final LiveMatchService service;

  LiveMatchScreen({required this.service});

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
      print('Maç Verileri Çekilemedi $error');
      // veya
      // Hata iletisi gösterme veya diğer hata yönetimi adımlarını buraya ekleyin
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maclar'),
        backgroundColor: const Color.fromARGB(255, 55, 19, 103),
      ),
      body: _matches.isEmpty
          ? const Center(
              child: Text(
              "Su anda herhangi bir maç yok!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
          : ListView.builder(
              itemCount: _matches.length,
              itemBuilder: (context, index) {
                final match = _matches[index];
                return Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      '${match.homeTeam} vs ${match.awayTeam}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Score: ${match.score}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
