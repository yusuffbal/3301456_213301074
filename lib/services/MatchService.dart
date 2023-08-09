// ignore_for_file: file_names, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/MatchModel.dart';

class MatchService {
  // Bilet rezervasyonundaki mac secimindeki maclarin datasini firestoredan ceker.
  // Mac verileri firestore database e el ile girilmistir.
  Future<List<MatchModel>> getMatches() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('maclar').get();
    List<MatchModel> matchList = [];
    querySnapshot.docs
        .forEach((DocumentSnapshot<Map<String, dynamic>> document) {
      MatchModel match = MatchModel.fromJson(document.data()!);
      matchList.add(match);
    });
    return matchList;
  }

}

