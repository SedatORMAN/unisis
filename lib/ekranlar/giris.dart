import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unisis/ekranlar/duyurular.dart';
import 'package:unisis/ekranlar/hata.dart';
import 'package:unisis/islemler/c_getir.dart';
import 'package:unisis/siniflar/c_siniflar.dart';
import 'package:unisis/widget/stdText1.dart';
import 'package:unisis/islemler/dosyaislemleri.dart';

class girisPage extends StatefulWidget {
  @override
  _girisPageState createState() => _girisPageState();
}

class _girisPageState extends State<girisPage> {
  final yaziCtrl =  TextEditingController();
  String strKulAdi = "";
  String strKulSifresi = "";
  bool boolHata = false;
  int intKulTipi = 0;
  bool isChecked = false;
  String doKullaniciAdi="";
  Kullanicilar  kullanici;

  void _strKulAdiAktar(String text) {
    setState(() {
      strKulAdi = text;
    });
  }

  void _strKulSifAktar(String text) {
    setState(() {
      strKulSifresi = text;
    });
  }

  void kontrol() {
    Stream<QuerySnapshot> yKullanici;
   //kullanici bilgisi kontrol ediliyor.
    if (yaziCtrl.text!="" && strKulAdi=="") strKulAdi=yaziCtrl.text;
    yKullanici = getirKullanicilarDT().where('kl_kul_adi',isEqualTo: strKulAdi).where('kl_kul_sifresi',isEqualTo: strKulSifresi).snapshots();
    yKullanici.listen((event) {
      if (event.docs.isEmpty )
      {
        showDialog(
          context: context,
          builder: (_) =>
              AlertDialog(
                title: stdText1("Hata !!!!", 20),
                content: stdText1("Hatalı kullanıcı adı veya şifresi", 15),
                backgroundColor: Colors.blue[400],
                elevation: 24.0,
              ),
          barrierDismissible: true,
        );
      }
      else
      {
        kullanici = Kullanicilar.fromFirestore(event.docs[0].data());
         if (isChecked) dosyaIslemleri.dosyayaKaydet(strKulAdi);
         Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) => duyurularGPage(),
                 settings: RouteSettings(arguments: kullanici)));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    dosyaIslemleri.dosyadanOku().then((String deger) {
      setState(() {
        doKullaniciAdi = deger;
        yaziCtrl.text= deger;
      });
    });
  }

  @override
  Widget build(BuildContext mainContext) {
    intKulTipi = 1; //ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4,
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: intKulTipi == 1
                                ? Image.asset('assets/images/ogrGor.jpg')
                                : Image.asset('assets/images/ogrenci.jpg')),
                        TextFormField(
                          style: TextStyle(color: Color(0xFF000000)),
                          cursorColor: Color(0xFF9b9b9b),
                          keyboardType: TextInputType.text,
                        //  initialValue: "$doKullaniciAdi",
                          controller: yaziCtrl,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              hintText: "Kullanıcı Adı",
                              hintStyle: TextStyle(
                                color: Color(0xFF9b9b9b),
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              )),
                          onChanged: (text) {
                            _strKulAdiAktar(text);
                          },
                        ),
                        TextFormField(
                          style: TextStyle(color: Color(0xFF000000)),
                          cursorColor: Color(0xFF9b9b9b),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.apps_sharp,
                                color: Colors.grey,
                              ),
                              hintText: "Paralo",
                              hintStyle: TextStyle(
                                color: Color(0xFF9b9b9b),
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              )),
                          onChanged: (text) {
                            _strKulSifAktar(text);
                          },
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text("Beni Hatırla"),
                            Checkbox(
                              checkColor: Colors.white,
                              value: isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 125,
                                child: FlatButton(
                                  onPressed: kontrol,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      top: 8,
                                      right: 10,
                                      bottom: 8,
                                    ),
                                    child: stdText1("Giriş", 15),
                                  ),
                                  color: Colors.blue[400],
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 125,
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      top: 8,
                                      right: 10,
                                      bottom: 8,
                                    ),
                                    child: stdText1("Ana Sayfa", 15),
                                  ),
                                  color: Colors.blue[400],
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
