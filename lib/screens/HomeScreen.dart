import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footballapp_2/screens/LeagueListScreen.dart';

import '../services/FlutterFireAuthService.dart';
import '../services/LiveMatchService.dart';
import '../widgets/BuildCard.dart';
import '../views/BiletAlView.dart';

import '../views/LiveMatchView.dart';

class HomeScreen extends StatelessWidget {
  final FlutterFireAuthService _authService =
      FlutterFireAuthService(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
         color: const Color.fromARGB(255, 55, 19, 103),
         child:  Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Container(
                height: height * .25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/topImage.png'),
                      fit: BoxFit.cover),
                ),
              ),
               Center(
                 child: GridView.count(
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
                         }),
                     GestureDetector(
                       child: buildcard(
                         "Bilet Al",
                         "assets/images/bilet.png",
                       ),
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => BiletAlmaSayfasi(),
                           ),
                         );
                       },
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
        );
    
  }
}
