import 'package:flutter/material.dart';
import 'package:footballapp_2/constants/constant.dart';
import 'package:footballapp_2/screens/LeagueListScreen.dart';
import 'package:footballapp_2/views/BiletAlView.dart';
import '../services/LiveMatchService.dart';
import '../views/LiveMatchView.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("FootballApp"),
          backgroundColor: constant.mavi1,
          leading: const SizedBox(), // Boş leading bölümü
        ),
        backgroundColor: constant.mavi3,
        body: Column(
          children: [
            const TabBar(tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.leaderboard)),
              Tab(icon: Icon(Icons.access_alarm)),
              Tab(icon: Icon(Icons.add_shopping_cart)),
            ]),
            Expanded(
              child: TabBarView(
                children: [
                  AnaEkran(),
                  LigList(),
                  LiveMatchScreen(service: LiveMatchService()),
                  BiletAlmaSayfasi(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnaEkran extends StatelessWidget {

  AnaEkran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                color: constant.mavi1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "     Ad:  Yusuf",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 15,),
                Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                color: constant.mavi1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "     Soyad:  Bal",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 15,),
                Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                color: constant.mavi1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "     E-posta:  yusuf.bal2016@gmail.com",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 15,),
                Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: constant.mavi1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "     Telefon:  05050915358",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
                
          ],
        ),
      ),
    );
  }
}
