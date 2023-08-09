
// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/BiletModel.dart';

class BiletService with ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveReservation(BiletModel bilet) {
    return firestore
    .collection('biletler')
    .doc(bilet.id)
    .set(bilet.toMap());
    // Firestore Database'e ekleme islemini gerceklestirmek icin gereken fonksiyondur.
  }

  Stream<List<BiletModel>> getBiletler()
  {
    return firestore
    .collection('biletler').snapshots().map((snapshot)=>snapshot
    .docs
    .map((document)=>BiletModel.fromFireStore(document.data()))
    .toList());

    // Firestore Database icerisinden rezervasyonlari listelemek icin gereken fonksiyondur.
  }

  Future<void> removeBilet(String id)
  {
    return firestore.collection('biletler').doc(id).delete();
    // Firestore database icerisindeki rezervasyonu silmek icin gereken fonksiyondur.
  }
 Future<void> updateReservation(BiletModel biletModel) {
  return firestore.collection('biletler').doc(biletModel.id).set(biletModel.toMap());
  // Firestore database icerisindeki rezervasyonun verilerini guncellemek icin gereken fonksiyondur.
 }
}