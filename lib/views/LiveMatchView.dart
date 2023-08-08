// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:footballapp_2/constants/constant.dart';

import '../models/LiveMatchModel.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.mavi3,
      appBar: AppBar(
        title: const Text('Maçlar'),
        backgroundColor: constant.mavi1,
      ),
      body: _matches.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _matches.length,
              itemBuilder: (context, index) {
                final match = _matches[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Center(
                        child: Text(
                          '${match.homeTeam} vs ${match.awayTeam}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          'Skor: ${match.score}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
