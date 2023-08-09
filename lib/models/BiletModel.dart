// ignore_for_file: file_names

// Olusturulacak ya da olusturulan biletlerin verisini kontrol edip erismek icin olusturulan model classi

class BiletModel {
   String? id;
   String? ad;
   String? soyad;
   String? email;
   String? match;
   String? stad;
   String? tarih;

  //constructor
  BiletModel({
     this.id,
     this.ad,
     this.soyad,
     this.email,
     this.match,
     this.stad,
     this.tarih,
  });

  // BiletModel nesnesindeki verileri mape donusturmek icin yapilan metod.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ad': ad,
      'soyad': soyad,
      'email': email,
      'match': match,
      'stad': stad,
      'tarih': tarih
    };
  }

  
  //FireStore database icerisindeki verilerini BiletModel nesnesine donusturen metod.
  BiletModel.fromFireStore(Map<String, dynamic> firestore)
  : id=firestore['id'],
    ad=firestore['ad'],
    soyad=firestore['soyad'],
    email=firestore['email'],
    stad=firestore['stad'],
    match=firestore['match'],
    tarih=firestore['tarih'];
}