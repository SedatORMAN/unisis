import 'package:flutter/material.dart';
import 'package:unisis/widget/menuG.dart';
import 'package:unisis/widget/menuO.dart';
import 'package:unisis/islemler/c_getir.dart';
import 'package:unisis/siniflar/c_siniflar.dart';

import 'package:unisis/islemler/dbUtils.dart';
import 'package:unisis/siniflar/dbModel.dart';

DbUtils utils = DbUtils();

class notgirisPage extends StatefulWidget {
  final Notlar notlar;

  notgirisPage([this.notlar]);
  @override
  _notgirisPageState createState() => _notgirisPageState();
}

class _notgirisPageState extends State<notgirisPage> {
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

  final vizeController = TextEditingController();
  final finalController = TextEditingController();
  final butunlemeController = TextEditingController();
  final sonucController = TextEditingController();
  String _vizeController;
  String _finalController;
  String _butunlemeController;
  String _sonucController;

  void _strVizeAktar(String text) {
    setState(() {
      _vizeController = text;
    });
  }

  void _strFinalAktar(String text) {
    setState(() {
      _finalController = text;
    });
  }
  void _strButunlemeAktar(String text) {
    setState(() {
      _butunlemeController = text;
    });
  }
  void _strSonucAktar(String text) {
    setState(() {
      _sonucController = text;
    });
  }
  
  @override
  void dispose() {
    vizeController.dispose();
    finalController.dispose();
    butunlemeController.dispose();
    sonucController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.notlar != null) {
      vizeController.text = widget.notlar.n_vize;
      finalController.text = widget.notlar.n_final;
      butunlemeController.text = widget.notlar.n_butunleme;
      sonucController.text = widget.notlar.n_sonuc;
      }
    super.initState();
  }

  void kaydetNot()
  {
    if (_vizeController!=null) widget.notlar.n_vize= _vizeController;
    if (_finalController!=null) widget.notlar.n_final= _finalController;
    if (_butunlemeController!=null) widget.notlar.n_butunleme= _butunlemeController;
    if (_sonucController!=null) widget.notlar.n_sonuc= _sonucController;
    kaydetNotlar(widget.notlar);
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
         drawer: listKullanici.kl_kul_tipi == 1
             ? menuG(listKullanici)
             : menuO(listKullanici),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: vizeController,
              decoration: InputDecoration(hintText: 'Vize'),
              onChanged: (text) {
                _strVizeAktar(text);
              },
            ),
            TextField(
              controller: finalController,
              decoration: InputDecoration(hintText: 'Final'),
              onChanged: (text) {
                _strFinalAktar(text);
              },
            ),
            TextField(
              controller: butunlemeController,
              decoration:
              InputDecoration(hintText: 'Bütümleme'),
              onChanged:(text) {
                _strButunlemeAktar(text);
              },
            ),
            TextField(
              controller: sonucController,
              decoration: InputDecoration(hintText: 'Sonuç'),
              onChanged: (text) {
                _strSonucAktar(text);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Kaydet'),
              onPressed: () {
                kaydetNot();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
