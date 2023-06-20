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
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
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
      return null;
    }
  }

  Future<User?> logIn(
      String email, String password, BuildContext context) async {
    try {
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
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
      return null;
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await _firebaseAuth.signOut().then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      });
    } catch (e) {}
  }

  Future<String?> getLoggedInUserName() async {
    User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
      DocumentSnapshot snapshot = await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .get();
      if (snapshot.exists) {
        return (snapshot.data() as Map<String, dynamic>)['user_name'];

      }
    }
    return null;
  }
}