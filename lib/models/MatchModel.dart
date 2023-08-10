// ignore_for_file: file_names

// Firestore Database icerisinde el ile girilen maclarin verilerine erisebilmek icin olusturulan model classi.

class MatchModel {
  String? ad;
  String? koltuk;
  int? kapasite;
  String? stad;
  String? tarih;
  String? documentId;

//constructor
  MatchModel({
    this.ad,
    this.koltuk,
    this.kapasite,
    this.stad,
    this.tarih,
    this.documentId,
  });


  // Firestore Database icerisinden json formatinda gelen veriyi MatchModel nesnesine donusturmek icin olusturulan metod.
  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      ad: json['ad'],
      koltuk: json['koltuk'],
      kapasite: json['kapasite'],
      stad: json['stad'],
      tarih: json['tarih'],
      documentId: json['documentId'], 
    );
  }
}
