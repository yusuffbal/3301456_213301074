// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:footballapp_2/models/BiletModel.dart';
import 'package:uuid/uuid.dart';

import '../services/BiletService.dart';
// State Management'in yapildigi classtir. Provider kutuphanesi kullanilmistir.

class BiletProvider with ChangeNotifier
{
  final firestoreService = BiletService();

  // Class icerisinde kullanilacak degiskenler.
  String? _id;
  String? _ad;
  String? _soyad;
  String? _email;
  String? _match;
  String? _stad;
  String? _tarih;   
  int? _kapasite;
  var uuid = const Uuid(); // UUID paketi ile benzersiz idler uretir.

  // Değişkenlere erişim için gereken getter metodlari
  String? get id => _id;
  String? get ad => _ad;
  String? get soyad => _soyad;
  String? get email => _email;
  String? get match => _match;
  String? get stad => _stad;
  String? get tarih => _tarih;
  int? get kapasite => _kapasite;


  changeAd(String value)
  {
    _ad = value;
    notifyListeners();
  }

  changeSoyad(String value)
  {
    _soyad = value;
    notifyListeners();
  }
  changeEmail(String value)
  {
    _email = value;
    notifyListeners();
  }
  changeMatch(String value)
  {
    _match = value;
    notifyListeners();
  }
  changeStad(String value)
  {
    _stad = value;
    notifyListeners();
  }
  changeTarih(String value)
  {
    _tarih = value;
    notifyListeners();
  }

   void changeKapasite(int value) { 
    _kapasite = value;
    notifyListeners();
  }

  //Firestore database'deki verileri yuklemek icin yazildi.
  LoadValues(BiletModel biletmodel)
  {
    _id=biletmodel.id;
    _ad=biletmodel.ad;
    _soyad=biletmodel.soyad;
    _email=biletmodel.email;
    _match=biletmodel.match;
    _stad=biletmodel.stad;
    _tarih=biletmodel.tarih;
  }

  //  Yeni bir bilet olusturmak icin veya var olan bir bileti guncellemek icin olusturulan metod.
 saveBiletmodel() {
  // Eger halihazirda olusturulan id degeri uzerinde bir bilet tanimli degilse yeni bilet olusturmak icin kullanilan if blogu.
  if (_id == null) {
    var newBiletmodel = BiletModel(
      id: uuid.v4(),
      ad: ad,
      soyad: soyad,
      email: email,
      match: match,
      stad: stad,
      tarih: tarih,
    );
    firestoreService.saveReservation(newBiletmodel);
  } 
  // Eger bir id uzerindeki biletin uzerine yazmaya yani guncelleme calisiliyorsa kullanilmasi icin olusturulan else blogu.
  else {
    var updateBiletmodel = BiletModel(
      id: id,
      ad: ad,
      soyad: soyad,
      email: email,
      match: match,
      stad: stad,
      tarih: tarih,
    );
    firestoreService.updateReservation(updateBiletmodel); // Güncelleme işlemi için yeni bir metod çağırılıyor
  }
}

// Bilet silmek icin kullanilan metod.
  removeBilet(String biletId) {
    firestoreService.removeBilet(biletId);
  }
}