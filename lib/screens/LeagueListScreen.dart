// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:footballapp_2/constants/constant.dart';
import '../widgets/BuildLeagueCard.dart';
import '../views/StandingView.dart';

class LigList extends StatefulWidget {
  const LigList({Key? key}) : super(key: key);

  @override
  State<LigList> createState() => _LigListState();
}

class _LigListState extends State<LigList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ligler",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: constant.mavi1,
      ),
      body: Container(
        color: constant.mavi4,
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'PD')),
                );
              },
              child: buildleaguecard("assets/images/laliga.png"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'PL')),
                );
              },
              child: buildleaguecard("assets/images/pl.png"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'SA')),
                );
              },
              child: buildleaguecard("assets/images/seria.png"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'FL1')),
                );
              },
              child: buildleaguecard("assets/images/lig1.png"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'BL1')),
                );
              },
              child: buildleaguecard("assets/images/bundesliga.png"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'DED')),
                );
              },
              child: buildleaguecard("assets/images/erdivise.png"),
            ),
          ],
        ),
      ),
    );
  }
}
