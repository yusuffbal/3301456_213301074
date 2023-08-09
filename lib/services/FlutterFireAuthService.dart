// ignore_for_file: file_names, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footballapp_2/screens/HomeScreen.dart';
import 'package:footballapp_2/screens/LoginScreen.dart';

class FlutterFireAuthService {
  final FirebaseAuth _firebaseAuth;
  FlutterFireAuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<User?> createAccount(
      String name, String email, String password) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Uye olusturma fonksiyonu
      User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      
      // Eger kullanici olustuysa girilen verilerin firestore database e aktarilmasi icin yazilan if blogu
      if (user != null) {
        await firestore.collection('users').doc(user.uid).set({
          "user_id": user.uid,
          "user_name": name,
          "user_email": email,
          "user_password": password,
        });

        return user;
      } else {
        return user;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> logIn(
    //Firebase Auth Login Metodu
      String email, String password, BuildContext context) async {
    try {
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        //Eger kullanici verileri dogru eslesiyorsa anasayfaya fonksiyon cagirildigi yerde kullaniciyi anasayfaya yonlendirmesi icin yazilan if blogu.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ),
        );
        return user;
      } else {
        return user;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> logOut(BuildContext context) async {
    //Cikis yapma butonu icin hazirlanan Logout metodu
    try {
      await _firebaseAuth.signOut().then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      });
    // ignore: empty_catches
    } catch (e) {
      throw Exception(e);
    }
  }

}