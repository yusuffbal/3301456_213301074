
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
    
  }

  Stream<List<BiletModel>> getBiletler()
  {
    return firestore
    .collection('biletler').snapshots().map((snapshot)=>snapshot
    .docs
    .map((document)=>BiletModel.fromFireStore(document.data()))
    .toList());
  }

  Future<void> removeBilet(String id)
  {
    return firestore.collection('biletler').doc(id).delete();
  }
 Future<void> updateReservation(BiletModel biletModel) {
  return firestore.collection('biletler').doc(biletModel.id).set(biletModel.toMap());
 }
}