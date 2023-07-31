import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footballapp_2/screens/LeagueListScreen.dart';
import 'package:footballapp_2/views/BiletAlView.dart';
import 'package:footballapp_2/constants/constant.dart';
import '../services/FlutterFireAuthService.dart';
import '../services/LiveMatchService.dart';
import '../views/LiveMatchView.dart';
import '../widgets/BuildCard.dart';

class HomeScreen extends StatelessWidget {
  final FlutterFireAuthService _authService = FlutterFireAuthService(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: constant.mavi1,
          child: Center(
            child: ListView(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                      GridView.count(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        children: [
                          GestureDetector(
                            child: buildcard(
                              "Puan Durumları",
                              "assets/images/kupa.png",
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LigList(),
                                ),
                              );
                            },
                          ),
                          GestureDetector(
                            child: buildcard(
                              "Canlı Skor",
                              "assets/images/canliskor.png",
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LiveMatchScreen(
                                    service: LiveMatchService(),
                                  ),
                                ),
                              );
                            },
                          ),
                          GestureDetector(
                            child: buildcard(
                              "Çıkış Yap",
                              "assets/images/cikisyap.png",
                            ),
                            onTap: () {
                              _authService.logOut(context);
                            },
                          ),
                          GestureDetector(
                            child: buildcard(
                              "Bilet Al",
                              "assets/images/bilet.png",
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BiletAlmaSayfasi(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
