import 'package:flutter/material.dart';
import 'package:unisis/widget/menuG.dart';
import 'package:unisis/widget/menuO.dart';
import 'package:unisis/islemler/c_getir.dart';
import 'package:unisis/siniflar/c_siniflar.dart';

import 'package:unisis/islemler/dbUtils.dart';
import 'package:unisis/siniflar/dbModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

DbUtils utils = DbUtils();

class duyurularGPage extends StatefulWidget {
  @override
  _duyurularGPageState createState() => _duyurularGPageState();
}

class _duyurularGPageState extends State<duyurularGPage> {
  List<dbModel> kayitList = [];
  int gelenRenk = 1;
  List<Color> olusanRenk = [
    Colors.cyan,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.black
  ];

  void dgGetir() async {
    await utils.kayitlar().then((result) => {
          setState(() {
            kayitList = result;
          })
        });
    if (kayitList.length > 0)
      gelenRenk = kayitList[0].renk;
    else
      gelenRenk = 1;
  }

  @override
  Widget build(BuildContext context) {
    dgGetir();

    //******************************************************************
    // Kullanici Kontrol ***********************************************
    //******************************************************************

    Kullanicilar listKullanici;
    listKullanici = ModalRoute.of(context).settings.arguments;
    if (listKullanici == null)
      Navigator.of(context).popUntil((route) => route.isFirst);

    //******************************************************************
    //******************************************************************

    return Scaffold(
      appBar: AppBar(
        title: Text('Üniversite Bilgi Sistemi'),
        centerTitle: true,
        backgroundColor: olusanRenk[gelenRenk],
      ),
      drawer: listKullanici.kl_kul_tipi == "1"
          ? menuG(listKullanici)
          : menuO(listKullanici),
      body: Column(
          children: [
            Container(
                color: Colors.blue[200],
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      " Duyurular",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: Text(" ")),
                    Text(
                        "${listKullanici.kl_kul_adi}(${listKullanici.kl_adi} ${listKullanici.kl_soyadi}) "),
                  ],
                ),
              ),
            Expanded(
              child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //******************************
                    // Tablo oluşturma kısmı
                    //******************************
                    Container(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: getirDuyurularDT()
                                .where('d_kul_tipi',
                                    isEqualTo: listKullanici.kl_kul_tipi)
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot asyncSnapshot) {
                              List<DocumentSnapshot> listOfDocumentSnap =
                                  asyncSnapshot.data.docs;
                              if (asyncSnapshot.hasData) {
                                return Flexible(
                                    child: ListView.builder(
                                  itemCount: listOfDocumentSnap.length,
                                  itemBuilder: (context, index) {
                                    return Expanded(
                                      child: Container(
                                        height: 40,
                                        padding: EdgeInsets.all(10),
                                        //decoration: BoxDecoration(border: Border.all(width: 0.5,color:Colors.blue[100])),
                                        color: index % 2 == 1
                                            ? Colors.blue[100]
                                            : Colors.blue[50],
                                        child: Text(
                                            '${Duyurular.fromFirestore(listOfDocumentSnap[index].data()).d_icerik}'),
                                      ),
                                    );
                                    // };
                                  },
                                ));
                              }
                            },
                          ),
                        ),
                  ],
                ),
            )
          ],
        ),
    );
  }
}
