class BiletModel {
   String? id;
   String? ad;
   String? soyad;
   String? email;
   String? match;
   String? stad;
   String? tarih;


  BiletModel({
     this.id,
     this.ad,
     this.soyad,
     this.email,
     this.match,
     this.stad,
     this.tarih,
  });

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

  BiletModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        ad = map['ad'],
        soyad = map['soyad'],
        email = map['email'],
        match = map['match'],
        stad = map['stad'],
        tarih = map['tarih'];


  BiletModel.fromFireStore(Map<String, dynamic> firestore)
  : id=firestore['id'],
    ad=firestore['ad'],
    soyad=firestore['soyad'],
    email=firestore['email'],
    stad=firestore['stad'],
    match=firestore['match'],
    tarih=firestore['tarih'];
    
    


}