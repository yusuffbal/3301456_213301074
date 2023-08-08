// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:footballapp_2/constants/constant.dart';
import 'package:footballapp_2/views/BiletlerimView.dart';
import 'package:provider/provider.dart';

import '../Provider/BiletProvider.dart';
import '../models/MatchModel.dart';
import '../services/MatchService.dart';

class BiletAlmaSayfasi extends StatefulWidget {
  const BiletAlmaSayfasi({super.key});

  @override
  _BiletAlmaSayfasiState createState() => _BiletAlmaSayfasiState();
}

class _BiletAlmaSayfasiState extends State<BiletAlmaSayfasi> {
  final adController = TextEditingController();
  final soyadController = TextEditingController();
  final mailController = TextEditingController();
  String? selectedMatch;
  List<MatchModel> matches = [];
  String? selectedStad;
  String? selectedTarih;

  @override
  void initState() {
    super.initState();
    loadMatches();
  }

  Future<void> loadMatches() async {
    MatchService matchService = MatchService();
    List<MatchModel> loadedMatches = await matchService.getMatches();
    setState(() {
      matches = loadedMatches;
      selectedMatch = loadedMatches.isNotEmpty ? loadedMatches[0].ad : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final biletProvider = Provider.of<BiletProvider>(context);
    return Scaffold(
      backgroundColor: constant.mavi4,
      appBar: AppBar(
        title: const Text('Bilet Alma Sayfası'),
        backgroundColor: constant.mavi1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Maç Seçin',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                dropdownColor: constant.mavi4,
                style: const TextStyle(color: Colors.white),
                value: selectedMatch,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedStad = matches
                        .firstWhere((match) => match.ad == newValue)
                        .stad;
                    selectedTarih = matches
                        .firstWhere((match) => match.ad == newValue)
                        .tarih;
                    selectedMatch =
                        matches.firstWhere((match) => match.ad == newValue).ad;
                  });
                  biletProvider.changeMatch(selectedMatch!);
                  biletProvider.changeStad(selectedStad!);
                  biletProvider.changeTarih(selectedTarih!);
                },
                items:
                    matches.map<DropdownMenuItem<String>>((MatchModel match) {
                  return DropdownMenuItem<String>(
                    value: match.ad,
                    child: Text(match.ad!),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: adController,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  biletProvider.changeAd(value);
                },
                decoration: const InputDecoration(
                    labelText: 'Adınız',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: soyadController,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  biletProvider.changeSoyad(value);
                },
                decoration: const InputDecoration(
                    labelText: 'Soyadınız',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: mailController,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  biletProvider.changeEmail(value);
                },
                decoration: const InputDecoration(
                    labelText: 'E-posta Adresiniz',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: constant.mavi1,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 20.0),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Bilet Al',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  biletProvider.saveBiletmodel();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Bilet Alındı'),
                        content:
                            const Text('Bilet rezervasyonunuz alınmıştır.'),
                        actions: [
                          TextButton(
                            child: const Text('Tamam'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: constant.mavi1,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 20.0),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Biletlerim',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BiletlerimSayfasi(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
