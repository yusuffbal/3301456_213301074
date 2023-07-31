import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/MatchModel.dart';

class MatchService {
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
Future<void> updateMatchCapacity(String matchAdi, int yeniKapasite) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('maclar')
      .where('ad', isEqualTo: matchAdi)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
    String matchId = documentSnapshot.id;

    Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;
    data?['kapasite'] = yeniKapasite;

    await FirebaseFirestore.instance
        .collection('maclar')
        .doc(matchId)
        .set(data!);
  } else {
    throw Exception('Aktif maç verisi bulunamadı!');
  }
}


}
