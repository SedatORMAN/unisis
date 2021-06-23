import 'package:flutter/material.dart';
import 'package:unisis/ekranlar/giris.dart';
import 'package:unisis/ekranlar/hakkinda.dart';
import 'package:unisis/islemler/havadurumu.dart';
import 'package:unisis/test.dart';
import 'package:unisis/widget/stdText1.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: mainPage()));
}

class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int intOgretimGorevlisi = 1;
  int intOgrenci = 2;
  String strHavaDurumuSicaklik="";
  String strHavaDurumuDurum ="";

  havaDurumuVeri havaDurumu = havaDurumuVeri();

  void getirHavaDurumu() async {
    await havaDurumu.getirSuAnkiSicakligi();
    if (havaDurumu.suankiSicaklik!=null) strHavaDurumuSicaklik=havaDurumu.suankiSicaklik.round().toString()+"°";
    if (havaDurumu.suankiDurum!=null) strHavaDurumuDurum=havaDurumu.suankiDurum.toString();
  }
  @override
  Widget build(BuildContext context) {
    if (strHavaDurumuSicaklik == "") getirHavaDurumu();

    return Scaffold(
      appBar: AppBar(
        title: Text('Üniversite Bilgi Sistemi'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Text(
                  strHavaDurumuSicaklik,style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                child: Text(
                  strHavaDurumuDurum,style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    color: Colors.blue[300],
                    child: Container(
                      height: 220,
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        image: DecorationImage(
                          image: AssetImage('assets/images/ogrGor.jpg'),
                        ),
                      ),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    padding: EdgeInsets.all(2),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => girisPage(),
                              settings:
                                  RouteSettings(arguments: intOgretimGorevlisi)));
                    },
                  ),
                  SizedBox(height: 5,),
                  // ignore: deprecated_member_use
                  FlatButton(
                    color: Colors.blue[300],
                    child: Container(
                      height: 220,
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                       image: DecorationImage(
                          image: AssetImage('assets/images/ogrenci.jpg'),
                        ),
                      ),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    padding: EdgeInsets.all(2),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => girisPage(),
                              settings: RouteSettings(arguments: intOgrenci)));
                    },
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => hakkindaPage()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              top: 8,
                              right: 10,
                              bottom: 8,
                            ),
                            child: stdText1(
                              "Hakkında",15),
                          ),
                          color: Colors.blue[400],
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => deneme()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              top: 8,
                              right: 10,
                              bottom: 8,
                            ),
                            child: stdText1(
                                "Test",15),
                          ),
                          color: Colors.blue[400],
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
