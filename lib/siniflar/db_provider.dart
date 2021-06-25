import 'package:flutter/material.dart';
import 'package:unisis/siniflar/c_siniflar.dart';
import 'package:unisis/islemler/dbfirestore.dart';
import 'package:uuid/uuid.dart';


class NotlarProvider with ChangeNotifier {

  final firestoreService = dbFireStore();
  String _n_ogr_no;
  String _n_ders_no;
  String _n_ders_adi;
  String _n_vize;
  String _n_final;
  String _n_butunleme;
  String _n_sonuc;

  var uuid = Uuid();

  String get n_ogr_no => _n_ogr_no;
  String get n_ders_no =>_n_ders_no;
  String get n_ders_adi =>_n_ders_adi;
  String get n_vize =>_n_vize;
  String get n_final =>_n_final;
  String get n_butunleme =>_n_butunleme;
  String get n_sonuc =>_n_sonuc;

  changeVize(String value) {
    _n_vize = value;
    notifyListeners();
  }

  changeFinal(String value) {
    _n_final = value;
    notifyListeners();
  }

  changeButunleme(String value) {
    _n_butunleme = value;
    notifyListeners();
  }

  changeSonuc(String value) {
    _n_sonuc = value;
    notifyListeners();
  }

  yukleNotP(Notlar not) {
    _n_ogr_no = not.n_ogr_no;
    _n_ders_no = not.n_ders_no;
    _n_ders_adi = not.n_ders_adi;
    _n_vize = not.n_vize;
    _n_final = not.n_final;
    _n_butunleme = not.n_butunleme;
    _n_sonuc = not.n_sonuc;
  }

  kaydetNotP() {
    print(_n_ogr_no);
    if (_n_ogr_no == null) {
      var yeniNot = Notlar(
          n_ogr_no: uuid.v4(),
          n_ders_no: n_ders_no,
          n_ders_adi: n_ders_adi,
          n_vize: n_vize,
          n_final: n_final,
          n_butunleme: n_butunleme,
          n_sonuc: n_sonuc);
      firestoreService.kaydetNotlar(yeniNot);
    } else {
      //Update
      var guncelleNot = Notlar(
          n_ogr_no: n_ogr_no,
          n_ders_no: n_ders_no,
          n_ders_adi: n_ders_adi,
          n_vize: n_vize,
          n_final: n_final,
          n_butunleme: n_butunleme,
          n_sonuc: n_sonuc);
      firestoreService.kaydetNotlar(guncelleNot);
    }
  }

  silNotP(String id) {
    firestoreService.silNotlar(id);
  }
}
