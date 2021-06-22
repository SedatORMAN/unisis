
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';

import '../siniflar/c_siniflar.dart';
import 'package:unisis/islemler/dbfirestore.dart';

dbFireStore fsDatabase = dbFireStore();

CollectionReference getirKullanicilarDT(){
  return fsDatabase.getirKullanicilarDT();
}

CollectionReference getirDuyurularDT() {
  return fsDatabase.getirDuyurularDT();
}

CollectionReference getirOgrencilerDT() {
  return fsDatabase.getirOgrencilerDT();
}

CollectionReference getirNotlarDT() {
  return fsDatabase.getirNotlarDT();
}

CollectionReference getirSinavlarDT() {
  return fsDatabase.getirSinavlarDT();
}

clsKullanici kullaniciBilgisi(String strKulAdi, String strKulSifre) {
  clsKullanici kullaniciBilgi = new clsKullanici();
  if ((strKulAdi == 'Sedat') && (strKulSifre == "Sedat")) {
    kullaniciBilgi.intKulID = 1;
    kullaniciBilgi.strKulAdi = "Sedat";
    kullaniciBilgi.intKulTipi = 1;
    kullaniciBilgi.strAdiSoyadi = "Sedat Sedat";
  } else if ((strKulAdi == 'Orman') && (strKulSifre == "Orman")) {
    kullaniciBilgi.intKulID = 2;
    kullaniciBilgi.strKulAdi = "Orman";
    kullaniciBilgi.intKulTipi = 2;
    kullaniciBilgi.strAdiSoyadi = "Orman Orman";
  } else if ((strKulAdi == 'Ogrenci2') && (strKulSifre == "2")) {
    kullaniciBilgi.intKulID = 3;
    kullaniciBilgi.strKulAdi = "Ogrenci2";
    kullaniciBilgi.intKulTipi = 2;
    kullaniciBilgi.strAdiSoyadi = "Kadın Kadın";
  } else if ((strKulAdi == 'Ogrenci3') && (strKulSifre == "3")) {
    kullaniciBilgi.intKulID = 4;
    kullaniciBilgi.strKulAdi = "Kadin2";
    kullaniciBilgi.intKulTipi = 2;
    kullaniciBilgi.strAdiSoyadi = "Kadın2 Kadın2";
  }
  return kullaniciBilgi;
}

clsKullanici kullaniciBilgisiID(int intKulID) {
  clsKullanici kullaniciBilgi = new clsKullanici();
  if (intKulID == 1) {
    kullaniciBilgi.intKulID = 1;
    kullaniciBilgi.strKulAdi = "Sedat";
    kullaniciBilgi.intKulTipi = 1;
    kullaniciBilgi.strAdiSoyadi = "Sedat Sedat";
  } else if (intKulID == 2) {
    kullaniciBilgi.intKulID = 2;
    kullaniciBilgi.strKulAdi = "Orman";
    kullaniciBilgi.intKulTipi = 2;
    kullaniciBilgi.strAdiSoyadi = "Orman Orman";
  } else if (intKulID == 3) {
    kullaniciBilgi.intKulID = 3;
    kullaniciBilgi.strKulAdi = "Ogrenci2";
    kullaniciBilgi.intKulTipi = 2;
    kullaniciBilgi.strAdiSoyadi = "Kadın Kadın";
  } else if (intKulID == 4) {
    kullaniciBilgi.intKulID = 4;
    kullaniciBilgi.strKulAdi = "Ogrenci3";
    kullaniciBilgi.intKulTipi = 2;
    kullaniciBilgi.strAdiSoyadi = "Kadın2 Kadın2";
  }
  return kullaniciBilgi;
}


List<clsDuyurular> duyurulariGetir(int intKulID) {
  List<clsDuyurular> duyurular = [];
  clsDuyurular duyuru = new clsDuyurular();

  if (intKulID == 1) {
    duyuru.intId = 1;
    duyuru.strIcerik = "Öğretim görevlileri ders dağılımı yapıldı";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 2;
    duyuru.strIcerik = "Öğretim görevlileri uzaktan eğitime devam edecekler";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 3;
    duyuru.strIcerik = "Bu sene yaz etkinlikeri yapılmayacak";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 4;
    duyuru.strIcerik =
    "Covid19 tedbirlerine harfiyen uyalım. Uymayanları uyaralım.";
    duyurular.add(duyuru);
  } else if (intKulID == 2) {
    duyuru.intId = 1;
    duyuru.strIcerik =
    "Öğrenciler kendilerine verilen ödevleri zamanında tesim etmekle yükümlüler.";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 2;
    duyuru.strIcerik =
    "Uzaktan eğitime devam edilecek. Sınavlar uzaktan, online olarak yapılacaktır.";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 3;
    duyuru.strIcerik = "Bu sene yaz etkinlikeri yapılmayacak";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 4;
    duyuru.strIcerik =
    "Covid19 tedbirlerine harfiyen uyalım. Uymayanları uyaralım.";
    duyurular.add(duyuru);
  } else if (intKulID == 3) {
    duyuru.intId = 1;
    duyuru.strIcerik =
    "Öğrenciler kendilerine verilen ödevleri zamanında tesim etmekle yükümlüler.";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 2;
    duyuru.strIcerik =
    "Uzaktan eğitime devam edilecek. Sınavlar uzaktan, online olarak yapılacaktır.";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 3;
    duyuru.strIcerik = "Bu sene yaz etkinlikeri yapılmayacak";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 4;
    duyuru.strIcerik =
    "Covid19 tedbirlerine harfiyen uyalım. Uymayanları uyaralım.";
    duyurular.add(duyuru);
  } else if (intKulID == 4) {
    duyuru.intId = 1;
    duyuru.strIcerik =
    "Öğrenciler kendilerine verilen ödevleri zamanında tesim etmekle yükümlüler.";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 2;
    duyuru.strIcerik =
    "Uzaktan eğitime devam edilecek. Sınavlar uzaktan, online olarak yapılacaktır.";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 3;
    duyuru.strIcerik = "Bu sene yaz etkinlikeri yapılmayacak";
    duyurular.add(duyuru);
    duyuru = new clsDuyurular();
    duyuru.intId = 4;
    duyuru.strIcerik =
    "Covid19 tedbirlerine harfiyen uyalım. Uymayanları uyaralım.";
    duyurular.add(duyuru);
  }
  return duyurular;
}

clsOgrenciBilgi ogrenciBilgiGetir(int intKulID) {
  clsOgrenciBilgi ogrenciBilgi = new clsOgrenciBilgi();
  if (intKulID == 2) {
    ogrenciBilgi.intOgrNo = 203311096;
    ogrenciBilgi.strOgrAdiSoyadi = "Orman Orman";
    ogrenciBilgi.strFakulte = "Teknoloji Fakültesi";
    ogrenciBilgi.strBolum = "Bilgisayar Mühendisliği";
    ogrenciBilgi.strEPosta = "2033@selcuk.edu.tr";
    ogrenciBilgi.strTelefon = "5550000001";
    ogrenciBilgi.strAdres = "Ankara/Türkiye";
  } else if (intKulID == 3) {
    ogrenciBilgi.intOgrNo = 203311196;
    ogrenciBilgi.strOgrAdiSoyadi = "Kadın Kadın";
    ogrenciBilgi.strFakulte = "Teknoloji Fakültesi";
    ogrenciBilgi.strBolum = "Bilgisayar Mühendisliği";
    ogrenciBilgi.strEPosta = "203311196@selcuk.edu.tr";
    ogrenciBilgi.strTelefon = "6660000001";
    ogrenciBilgi.strAdres = "Konya/Türkiye";
  } else if (intKulID == 4) {
    ogrenciBilgi.intOgrNo = 203311296;
    ogrenciBilgi.strOgrAdiSoyadi = "Kadın2 Kadın2";
    ogrenciBilgi.strFakulte = "Teknoloji Fakültesi";
    ogrenciBilgi.strBolum = "Bilgisayar Mühendisliği";
    ogrenciBilgi.strEPosta = "203311296@selcuk.edu.tr";
    ogrenciBilgi.strTelefon = "7770000001";
    ogrenciBilgi.strAdres = "İstanbul/Türkiye";
  }
  return ogrenciBilgi;
}




List<clsNotBilgi> notlariGetir(int intOgrNo) {
  List<clsNotBilgi> notlar = [];
  clsNotBilgi not = new clsNotBilgi();

  if (intOgrNo == 203311096) {
    not.intOgrNo = 203311096;
    not.intDersKodu=1;
    not.strDersAdi="Mobil Programlama";
    not.doubVize1 =80;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311096;
    not.intDersKodu=2;
    not.strDersAdi="Ayrık Matematik";
    not.doubVize1 =96;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311096;
    not.intDersKodu=3;
    not.strDersAdi="Veritabanı Yönetim Sistemi";
    not.doubVize1 =92;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311096;
    not.intDersKodu=4;
    not.strDersAdi="Mantık Devreleri-2";
    not.doubVize1 =84;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311096;
    not.intDersKodu=5;
    not.strDersAdi="Yazılım Mühendisliği";
    not.doubVize1 =88;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311096;
    not.intDersKodu=6;
    not.strDersAdi="İşletim Sistemleri Yönetimi";
    not.doubVize1 =88;
    notlar.add(not);
  } else if (intOgrNo == 203311196) {
    not.intOgrNo = 203311196;
    not.intDersKodu=1;
    not.strDersAdi="Mobil Programlama";
    not.doubVize1 =76;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311196;
    not.intDersKodu=2;
    not.strDersAdi="Ayrık Matematik";
    not.doubVize1 =72;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311196;
    not.intDersKodu=3;
    not.strDersAdi="Veritabanı Yönetim Sistemi";
    not.doubVize1 =68;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311196;
    not.intDersKodu=4;
    not.strDersAdi="Mantık Devreleri-2";
    not.doubVize1 =84;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311196;
    not.intDersKodu=5;
    not.strDersAdi="Yazılım Mühendisliği";
    not.doubVize1 =92;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311196;
    not.intDersKodu=6;
    not.strDersAdi="İşletim Sistemleri Yönetimi";
    not.doubVize1 =84;
    notlar.add(not);
  } else if (intOgrNo == 203311296) {
    not.intOgrNo = 203311296;
    not.intDersKodu=1;
    not.strDersAdi="Mobil Programlama";
    not.doubVize1 =68;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311296;
    not.intDersKodu=2;
    not.strDersAdi="Ayrık Matematik";
    not.doubVize1 =60;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311296;
    not.intDersKodu=3;
    not.strDersAdi="Veritabanı Yönetim Sistemi";
    not.doubVize1 =56;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311296;
    not.intDersKodu=4;
    not.strDersAdi="Mantık Devreleri-2";
    not.doubVize1 =60;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311296;
    not.intDersKodu=5;
    not.strDersAdi="Yazılım Mühendisliği";
    not.doubVize1 =68;
    notlar.add(not);
    not = new clsNotBilgi();
    not.intOgrNo = 203311296;
    not.intDersKodu=6;
    not.strDersAdi="İşletim Sistemleri Yönetimi";
    not.doubVize1 =72;
    notlar.add(not);
  }
  return notlar;
}

List<clsSinavTarihi> sinavTarihleriGetir(int intOgrNo) {
  List<clsSinavTarihi> sinavTarihleri = [];
  clsSinavTarihi sinavTarihi = new clsSinavTarihi();

  if (intOgrNo == 203311096) {
    sinavTarihi.intOgrNo = 203311096;
    sinavTarihi.intDersKodu=1;
    sinavTarihi.strDersAdi="Mobil Programlama";
    sinavTarihi.strVizeTarihi ="30/04/2021 23:59";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311096;
    sinavTarihi.intDersKodu=2;
    sinavTarihi.strDersAdi="Ayrık Matematik";
    sinavTarihi.strVizeTarihi ="22/04/2021 08:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311096;
    sinavTarihi.intDersKodu=3;
    sinavTarihi.strDersAdi="Veritabanı Yönetim Sistemi";
    sinavTarihi.strVizeTarihi ="22/04/2021 10:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311096;
    sinavTarihi.intDersKodu=4;
    sinavTarihi.strDersAdi="Mantık Devreleri-2";
    sinavTarihi.strVizeTarihi ="20/04/2021 10:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311096;
    sinavTarihi.intDersKodu=5;
    sinavTarihi.strDersAdi="Yazılım Mühendisliği";
    sinavTarihi.strVizeTarihi ="29/04/2021 10:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311096;
    sinavTarihi.intDersKodu=6;
    sinavTarihi.strDersAdi="İşletim Sistemleri Yönetimi";
    sinavTarihi.strVizeTarihi ="22/04/2021 16:00";
    sinavTarihleri.add(sinavTarihi);
  } else if (intOgrNo == 203311196) {
    sinavTarihi.intOgrNo = 203311196;
    sinavTarihi.intDersKodu=1;
    sinavTarihi.strDersAdi="Mobil Programlama";
    sinavTarihi.strVizeTarihi ="30/04/2021 23:59";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311196;
    sinavTarihi.intDersKodu=2;
    sinavTarihi.strDersAdi="Ayrık Matematik";
    sinavTarihi.strVizeTarihi ="22/04/2021 08:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311196;
    sinavTarihi.intDersKodu=3;
    sinavTarihi.strDersAdi="Veritabanı Yönetim Sistemi";
    sinavTarihi.strVizeTarihi ="22/04/2021 10:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311196;
    sinavTarihi.intDersKodu=4;
    sinavTarihi.strDersAdi="Mantık Devreleri-2";
    sinavTarihi.strVizeTarihi ="20/04/2021 10:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311196;
    sinavTarihi.intDersKodu=5;
    sinavTarihi.strDersAdi="Yazılım Mühendisliği";
    sinavTarihi.strVizeTarihi ="29/04/2021 10:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311196;
    sinavTarihi.intDersKodu=6;
    sinavTarihi.strDersAdi="İşletim Sistemleri Yönetimi";
    sinavTarihi.strVizeTarihi ="22/04/2021 16:00";
    sinavTarihleri.add(sinavTarihi);
  } else if (intOgrNo == 203311296) {
    sinavTarihi.intOgrNo = 203311296;
    sinavTarihi.intDersKodu=1;
    sinavTarihi.strDersAdi="Mobil Programlama";
    sinavTarihi.strVizeTarihi ="30/04/2021 23:59";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311296;
    sinavTarihi.intDersKodu=2;
    sinavTarihi.strDersAdi="Ayrık Matematik";
    sinavTarihi.strVizeTarihi ="22/04/2021 08:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311296;
    sinavTarihi.intDersKodu=3;
    sinavTarihi.strDersAdi="Veritabanı Yönetim Sistemi";
    sinavTarihi.strVizeTarihi ="22/04/2021 10:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311296;
    sinavTarihi.intDersKodu=4;
    sinavTarihi.strDersAdi="Mantık Devreleri-2";
    sinavTarihi.strVizeTarihi ="20/04/2021 10:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311296;
    sinavTarihi.intDersKodu=5;
    sinavTarihi.strDersAdi="Yazılım Mühendisliği";
    sinavTarihi.strVizeTarihi ="29/04/2021 10:00";
    sinavTarihleri.add(sinavTarihi);
    sinavTarihi = new clsSinavTarihi();
    sinavTarihi.intOgrNo = 203311296;
    sinavTarihi.intDersKodu=6;
    sinavTarihi.strDersAdi="İşletim Sistemleri Yönetimi";
    sinavTarihi.strVizeTarihi ="22/04/2021 16:00";
    sinavTarihleri.add(sinavTarihi);
  }
  return sinavTarihleri;
}