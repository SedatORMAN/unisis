import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unisis/widget/menuG.dart';
import 'package:unisis/widget/menuO.dart';
import 'package:unisis/islemler/c_getir.dart';
import 'package:unisis/siniflar/c_siniflar.dart';
import 'package:unisis/ekranlar/ogorevli/notgiris.dart';

import 'package:unisis/islemler/dbUtils.dart';
import 'package:unisis/siniflar/dbModel.dart';

DbUtils utils = DbUtils();

class deneme extends StatefulWidget {
  @override
  _denemeState createState() => _denemeState();
}

class _denemeState extends State<deneme> {
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
    gelenRenk = kayitList[0].renk;
    if (gelenRenk == null) gelenRenk = 1;
  }

  @override
  Widget build(BuildContext context) {
    dgGetir();
    //******************************************************************
    // Kullanici Kontrol ***********************************************
    //******************************************************************
    // Kullanicilar listKullanici;
    // listKullanici = ModalRoute.of(context).settings.arguments;
    // if (listKullanici == null)
    //   Navigator.of(context).popUntil((route) => route.isFirst);
    //******************************************************************
    //******************************************************************

    return Scaffold(
      appBar: AppBar(
        title: Text('Üniversite Bilgi Sistemi'),
        centerTitle: true,
        backgroundColor: olusanRenk[gelenRenk],
      ),
      // drawer: listKullanici.kl_kul_tipi == 1
      //     ? menuG(listKullanici)
      //     : menuO(listKullanici),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.blue[100],
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  " Notlar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Text(" ")),
         //      Text("${listKullanici.kl_kul_adi}(${listKullanici.kl_adi} ${listKullanici.kl_soyadi}) "),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        color: Colors.blue[50]),
                    child: Text(
                      "Ögr. No",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        color: Colors.blue[50]),
                    child: Text(
                      "Öğrenci Adı",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 85,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        color: Colors.blue[50]),
                    child: Text(
                      "Vize",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 85,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        color: Colors.blue[50]),
                    child: Text(
                      "Final",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 85,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        color: Colors.blue[50]),
                    child: Text(
                      "Büt",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 85,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        color: Colors.blue[50]),
                    child: Text(
                      "Sonuç",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 85,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        color: Colors.blue[50]),
                    child: Text(
                      "",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream:getirNotlarDT().where('n_ders_no',isEqualTo: "1").orderBy('n_ogr_no').snapshots(),
              builder:(BuildContext context, AsyncSnapshot asyncSnapshot){
                List<DocumentSnapshot> listOfDocumentSnap = asyncSnapshot.data.docs;
                return ListView.builder(
                  itemCount: listOfDocumentSnap.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex:2,
                              child: Container(
                                height: 40,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5,
                                        color: Colors.grey
                                            .withOpacity(0.5))),
                                child: Text(
                                    "${Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_ogr_no}"),
                              ),
                            ),
                            Expanded(
                              flex:7,
                              child: Container(
                                height: 40,
                                width: 150,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5,
                                        color: Colors.grey
                                            .withOpacity(0.5))),
                                child: Text(
                                    "${getirOgrenciAdiSoyadi(Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_ogr_no)}"),
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: Container(
                                height: 40,
                                width: 85,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5,
                                        color: Colors.grey
                                            .withOpacity(0.5))),
                                child: Text(
                                    "${Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_vize}"),
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: Container(
                                height: 40,
                                width: 85,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5,
                                        color: Colors.grey
                                            .withOpacity(0.5))),
                                child: Text(
                                    "${Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_final}"),
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: Container(
                                height: 40,
                                width: 85,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5,
                                        color: Colors.grey
                                            .withOpacity(0.5))),
                                child: Text(
                                    "${Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_butunleme}"),
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: Container(
                                height: 40,
                                width: 85,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5,
                                        color: Colors.grey
                                            .withOpacity(0.5))),
                                child: Text(
                                    "${Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_sonuc}"),
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: Container(
                                height: 40,
                                width: 85,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5,
                                        color: Colors.grey
                                            .withOpacity(0.5))),
                                child: IconButton(onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          notgirisPage(Notlar.fromFirestore(listOfDocumentSnap[index].data())))
                                  );}, icon:Icon(Icons.add_to_photos_sharp)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );


                  },
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
