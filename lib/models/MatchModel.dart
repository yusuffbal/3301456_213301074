// ignore_for_file: file_names

class MatchModel {
  String? ad;
  String? koltuk;
  int? kapasite;
  String? stad;
  String? tarih;
  String? documentId;

  MatchModel({
    this.ad,
    this.koltuk,
    this.kapasite,
    this.stad,
    this.tarih,
    this.documentId,
  });

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
