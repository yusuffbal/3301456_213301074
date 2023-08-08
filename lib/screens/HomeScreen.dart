// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:footballapp_2/constants/constant.dart';
import 'package:footballapp_2/screens/LeagueListScreen.dart';
import 'package:footballapp_2/views/BiletAlView.dart';
import '../services/FlutterFireAuthService.dart';
import '../services/LiveMatchService.dart';
import '../views/LiveMatchView.dart';


class HomeScreen extends StatelessWidget {
  final FlutterFireAuthService _authService =
      FlutterFireAuthService(FirebaseAuth.instance);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FootballApp"),
        backgroundColor: constant.mavi1,
        leading: const SizedBox(), // Boş leading bölümü
      ),
      backgroundColor: constant.mavi3,
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            children: [
              buildGridItem(
                context,
                "Puan Durumları",
                "assets/images/kupa.png",
                const LigList(),
              ),
              buildGridItem(
                context,
                "Canlı Skor",
                "assets/images/canliskor.png",
                LiveMatchScreen(service: LiveMatchService()),
              ),
              buildGridItem(
                context,
                "Bilet Al",
                "assets/images/bilet.png",
                const BiletAlmaSayfasi(),
              ),
              buildGridItem(
                context,
                "Çıkış Yap",
                "assets/images/cikisyap.png",
                () => _authService.logOut(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildGridItem(
      BuildContext context, String title, String imagePath, dynamic destination) {
    return GestureDetector(
      onTap: () {
        if (destination is Widget) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        } else if (destination is Function) {
          destination();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 64,
              height: 64,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
