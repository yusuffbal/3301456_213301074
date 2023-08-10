// ignore_for_file: file_names

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
  // ignore: library_private_types_in_public_api
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
  
  // mac verilerini yuklemek icin olusturulan asenkron metod.
  Future<void> loadMatches() async {
    MatchService matchService = MatchService();
    List<MatchModel> loadedMatches = await matchService.getMatches();
    // mounted widgetin agac yapisinda olup olmadigini kontrol eder
    if (mounted) {
      setState(() {
        matches = loadedMatches;
        selectedMatch = loadedMatches.isNotEmpty ? loadedMatches[0].ad : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final biletProvider = Provider.of<BiletProvider>(context);
    return Scaffold(
      backgroundColor: constant.mavi4,
      appBar: AppBar(
        title: const Text('Bilet Rezervasyon'),
        backgroundColor: constant.mavi1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: constant.mavi1,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: 'Maç Seçin',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  dropdownColor: constant.mavi1,
                  style: const TextStyle(color: Colors.white),
                  value: selectedMatch,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedStad =
                          matches.firstWhere((match) => match.ad == newValue).stad;
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
                  items: matches.map<DropdownMenuItem<String>>(
                    (MatchModel match) {
                      return DropdownMenuItem<String>(
                        value: match.ad,
                        child: Text(
                          match.ad!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: adController,
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: constant.mavi1),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: constant.mavi1,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: constant.mavi1,
                  labelText: "Adınız",
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                onChanged: (value) {
                  biletProvider.changeAd(value);
                },
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: soyadController,
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: constant.mavi1),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: constant.mavi1,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: constant.mavi1,
                  labelText: "Soyadınız",
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                onChanged: (value) {
                  biletProvider.changeSoyad(value);
                },
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: mailController,
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: constant.mavi1),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: constant.mavi1,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: constant.mavi1,
                  labelText: "E-Posta Adresiniz",
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                onChanged: (value) {
                  biletProvider.changeEmail(value);
                },
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: constant.mavi1,
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Rezervasyon Yap',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  //BiletProvider kutuphanesindeki kaydetme fonksiyonuyla rezervasyon alinir
                  biletProvider.saveBiletmodel();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Rezervasyon Başarılı'),
                        content: const Text('Bilet rezervasyonunuz alınmıştır.'),
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
              const SizedBox(height: 30.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: constant.mavi1,
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Rezervasyonlarım',
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
