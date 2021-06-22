import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unisis/siniflar/c_siniflar.dart';
//import '../siniflar/c_siniflar.dart';



class dbFireStore {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  /****************Duyurular*********************/
  Future<void> kaydetDuyuru(Duyurular duyuru) {
    return _db
        .collection('duyurular')
        .doc(duyuru.id)
        .set(duyuru.toMap());
  }

  Stream<List<Duyurular>> getirDuyurular() {
    return _db.collection('duyurular').snapshots().map((snapshot) =>
        snapshot
            .docs
            .map((document) => Duyurular.fromFirestore(document.data()))
            .toList());
  }

  Future<List<Duyurular>> getirTipeGoreDuyurular(int intKulTipi) async {
    return _db.collection('duyurular').where(
        'd_kul_tipi', isEqualTo: intKulTipi.toString()).get().then(
            (snapshot) =>
            snapshot
                .docs
                .map((document) => Duyurular.fromFirestore(document.data()))
                .toList()
    );
  }

  CollectionReference getirDuyurularDT() {
    return _db.collection('duyurular');
  }

  Future<void> silDuyurular(String id) {
    return _db.collection('duyurular').doc(id).delete();
  }

  /*********************Kullanıcı********************/
  Future<void> kaydetKullanici(Kullanicilar kullanici) {
    return _db
        .collection('kullanicilar')
        .doc(kullanici.id)
        .set(kullanici.toMap());
  }

  Stream<List<Kullanicilar>> getirKullanicilar() {
    return _db.collection('kullanicilar').snapshots().map((snapshot) =>
        snapshot
            .docs
            .map((document) => Kullanicilar.fromFirestore(document.data()))
            .toList());
  }

  CollectionReference getirKullanicilarDT() {
    return _db.collection('kullanicilar');
  }

  Future<void> silKullanicilar(String id) {
    return _db.collection('kullanicilar').doc(id).delete();
  }

/*********************Ogrenciler********************/
Future<void> kaydetOgrenciler(Ogrenciler ogrenci) {
  return _db
      .collection('ogrenciler')
      .doc(ogrenci.o_ogr_no.toString())
      .set(ogrenci.toMap());
}

Stream<List<Ogrenciler>> getirOgrenciler() {
  return _db.collection('ogrenciler').snapshots().map((snapshot) =>
      snapshot
          .docs
          .map((document) => Ogrenciler.fromFirestore(document.data()))
          .toList());
}

CollectionReference getirOgrencilerDT() {
  return _db.collection('ogrenciler');
}

Future<void> silOgrenciler(String id) {
  return _db.collection('ogrenciler').doc(id).delete();
}

/*********************Notlar********************/
Future<void> kaydetNotlar(Notlar not) {
  return _db
      .collection('notlar')
      .doc(not.n_ogr_no.toString())
      .set(not.toMap());
}

Stream<List<Notlar>> getirNotlar() {
  return _db.collection('notlar').snapshots().map((snapshot) =>
      snapshot
          .docs
          .map((document) => Notlar.fromFirestore(document.data()))
          .toList());
}

CollectionReference getirNotlarDT() {
  return _db.collection('notlar');
}

Future<void> silNotlar(String id) {
  return _db.collection('notlar').doc(id).delete();
}
  /*********************Sınavlar********************/
  Future<void> kaydetSinavlar(Sinavlar sinav) {
    return _db
        .collection('sinavlar')
        .doc(sinav.s_ogr_no.toString())
        .set(sinav.toMap());
  }

  Stream<List<Sinavlar>> getirSinavlar() {
    return _db.collection('sinavlar').snapshots().map((snapshot) =>
        snapshot
            .docs
            .map((document) => Sinavlar.fromFirestore(document.data()))
            .toList());
  }

  CollectionReference getirSinavlarDT() {
    return _db.collection('sinavlar');
  }

  Future<void> silSinavlar(String id) {
    return _db.collection('sinavlar').doc(id).delete();
  }
}