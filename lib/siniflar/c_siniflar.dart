class Duyurular {
  final String id;
  final String d_icerik;
  final String d_kul_tipi;

  Duyurular(
      {this.id, this.d_icerik, this.d_kul_tipi});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'd_icerik': d_icerik,
      'd_kul_tipi': d_kul_tipi
    };
  }

  Duyurular.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        d_icerik = firestore['d_icerik'],
        d_kul_tipi = firestore['d_kul_tipi'];
}

//****************************Kullanıcılar*********************************/
class Kullanicilar {
  final String id;
  final String kl_kul_adi;
  final String kl_kul_sifresi;
  final String kl_kul_tipi;
  final String kl_adi;
  final String kl_soyadi;
  final String kl_uni_no;

  Kullanicilar(
      {this.id, this.kl_kul_adi,this.kl_kul_sifresi, this.kl_kul_tipi, this.kl_adi, this.kl_soyadi, this.kl_uni_no});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kl_kul_adi': kl_kul_adi,
      'kl_kul_sifresi':kl_kul_sifresi,
      'kl_kul_tipi': kl_kul_tipi,
      'kl_adi': kl_adi,
      'kl_soyadi': kl_soyadi,
      'kl_uni_no': kl_uni_no
    };
  }

  Kullanicilar.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        kl_kul_adi = firestore['kl_kul_adi'],
        kl_kul_sifresi = firestore['kl_kul_sifresi'],
        kl_kul_tipi = firestore['kl_kul_tipi'],
        kl_adi = firestore['kl_adi'],
        kl_soyadi = firestore['kl_soyadi'],
        kl_uni_no = firestore['kl_uni_no'];
}

//************************Ogrenciler******************************/
class Ogrenciler {
  final String o_ogr_no;
  final String o_adi;
  final String o_soyadi;
  final String o_fak_id;
  final String o_bol_id;
  final String o_telefon;
  final String o_eposta;
  final String o_adres;

  Ogrenciler(
      {this.o_ogr_no, this.o_adi,this.o_soyadi, this.o_fak_id, this.o_bol_id, this.o_telefon, this.o_eposta, this.o_adres});

  Map<String, dynamic> toMap() {
    return {
      'o_ogr_no': o_ogr_no,
      'o_adi': o_adi,
      'o_soyadi':o_soyadi,
      'o_fak_id': o_fak_id,
      'o_bol_id': o_bol_id,
      'o_telefon': o_telefon,
      'o_eposta': o_eposta,
      'o_adres': o_adres
    };
  }

  Ogrenciler.fromFirestore(Map<String, dynamic> firestore)
      : o_ogr_no = firestore['o_ogr_no'],
        o_adi = firestore['o_adi'],
        o_soyadi = firestore['o_soyadi'],
        o_fak_id = firestore['o_fak_id'],
        o_bol_id = firestore['o_bol_id'],
        o_telefon = firestore['o_telefon'],
        o_eposta = firestore['o_eposta'],
        o_adres = firestore['o_adres'];
}
//************************Ogrenciler******************************/
class OgrentimGorevliler {
  final String og_ogrv_no;
  final String og_adi;
  final String og_soyadi;
  final String og_fak_id;
  final String og_bol_id;
  final String og_telefon;
  final String og_eposta;
  final String og_adres;

  OgrentimGorevliler(
      {this.og_ogrv_no, this.og_adi,this.og_soyadi, this.og_fak_id, this.og_bol_id, this.og_telefon, this.og_eposta, this.og_adres});

  Map<String, dynamic> toMap() {
    return {
      'og_ogrv_no': og_ogrv_no,
      'og_adi': og_adi,
      'og_soyadi':og_soyadi,
      'og_fak_id': og_fak_id,
      'og_bol_id': og_bol_id,
      'og_telefon': og_telefon,
      'og_eposta': og_eposta,
      'og_adres': og_adres
    };
  }

  OgrentimGorevliler.fromFirestore(Map<String, dynamic> firestore)
      : og_ogrv_no = firestore['og_ogrv_no'],
        og_adi = firestore['o_adi'],
        og_soyadi = firestore['og_soyadi'],
        og_fak_id = firestore['og_fak_id'],
        og_bol_id = firestore['og_bol_id'],
        og_telefon = firestore['og_telefon'],
        og_eposta = firestore['og_eposta'],
        og_adres = firestore['og_adres'];
}
//*****************************Notlar*********************************/
class Notlar {
  final String n_ogr_no;
  final String n_ders_no;
  final String n_ders_adi;
  final String n_vize;
  final String n_final;
  final String n_butunleme;
  final String n_sonuc;

  Notlar(
      {this.n_ogr_no, this.n_ders_no,this.n_ders_adi, this.n_vize, this.n_final, this.n_butunleme, this.n_sonuc});

  Map<String, dynamic> toMap() {
    return {
      'n_ogr_no': n_ogr_no,
      'n_ders_no': n_ders_no,
      'n_ders_adi':n_ders_adi,
      'n_vize': n_vize,
      'n_final': n_final,
      'n_butunleme': n_butunleme,
      'n_sonuc': n_sonuc
    };
  }

  Notlar.fromFirestore(Map<String, dynamic> firestore)
      : n_ogr_no = firestore['n_ogr_no'],
        n_ders_no = firestore['n_ders_no'],
        n_ders_adi = firestore['n_ders_adi'],
        n_vize = firestore['n_vize'],
        n_final = firestore['n_final'],
        n_butunleme = firestore['n_butunleme'],
        n_sonuc = firestore['n_sonuc'];
}

//*****************************Sınavlar*********************************/
class Sinavlar {
  final String s_ogr_no;
  final String s_ders_no;
  final String s_ders_adi;
  final String s_vize_t;
  final String s_final_t;
  final String s_butunleme_t;

  Sinavlar(
      {this.s_ogr_no, this.s_ders_no,this.s_ders_adi, this.s_vize_t, this.s_final_t, this.s_butunleme_t});

  Map<String, dynamic> toMap() {
    return {
      's_ogr_no': s_ogr_no,
      's_ders_no': s_ders_no,
      's_ders_adi':s_ders_adi,
      's_vize_t': s_vize_t,
      's_final_t': s_final_t,
      's_butunleme_t': s_butunleme_t
    };
  }

  Sinavlar.fromFirestore(Map<String, dynamic> firestore)
      : s_ogr_no = firestore['s_ogr_no'],
        s_ders_no = firestore['s_ders_no'],
        s_ders_adi = firestore['s_ders_adi'],
        s_vize_t = firestore['s_vize_t'],
        s_final_t = firestore['s_final_t'],
        s_butunleme_t = firestore['s_butunleme_t'];
}

//**************************************************************************/
//**************************************************************************/


class clsKullanici
{
  int intKulID;
  String strKulAdi;
  int intKulTipi;
  String strAdiSoyadi;

  clsKullanici({
    this.intKulID,
    this.strKulAdi,
    this.intKulTipi,
    this.strAdiSoyadi
  });
}

class clsDuyurular {
  int intId;
  String strIcerik;
  clsDuyurular({
    this.intId,
    this.strIcerik,
  });
}

class clsOgrenciBilgi {
  int intOgrNo;
  String strOgrAdiSoyadi;
  String strFakulte;
  String strBolum;
  String strAdres;
  String strEPosta;
  String strTelefon;
  clsOgrenciBilgi ({
    this.strOgrAdiSoyadi,
    this.strFakulte,
    this.strBolum,
    this.strAdres,
    this.strEPosta,
    this.strTelefon,
  });
}

class clsNotBilgi {
  int intOgrNo;
  int intDersKodu;
  String strDersAdi;
  double doubVize1;
  double doubFinal;
  double doubDersNotu;
  String strDersNotuHarf;
  clsNotBilgi ({
    this.intOgrNo,
    this.intDersKodu,
    this.strDersAdi,
    this.doubVize1,
    this.doubFinal,
    this.doubDersNotu,
    this.strDersNotuHarf,
  });
}

class clsSinavTarihi {
  int intOgrNo;
  int intDersKodu;
  String strDersAdi;
  String strVizeTarihi;
  String strFinalTarihi;
  String strButunlemeTarihi;
  clsSinavTarihi ({
    this.intOgrNo,
    this.intDersKodu,
    this.strDersAdi,
    this.strVizeTarihi,
    this.strFinalTarihi,
    this.strButunlemeTarihi,
  });
}