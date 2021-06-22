import 'package:flutter/material.dart';
import 'package:unisis/islemler/c_getir.dart';
import 'package:unisis/siniflar/c_siniflar.dart';
import 'package:unisis/islemler/dbUtils.dart';
import 'package:unisis/siniflar/dbModel.dart';
import 'package:unisis/widget/menuG.dart';
import 'package:unisis/widget/menuO.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class ayarlarPage extends StatefulWidget {
   @override
  _ayarlarState createState() => _ayarlarState();
}
DbUtils utils = DbUtils();

class _ayarlarState extends State<ayarlarPage> {

 List<dbModel> kayitList = [];

  int secilenRenk = 1;
  int gelenRenk = 1;
  List<Color> olusanRenk =[Colors.cyan,Colors.blue,Colors.red,Colors.yellow,Colors.green,Colors.black];

  _onPressedUpdate() async {
    final xKayit = dbModel(
      id: 1,
      ekran:"ilkEkran",
      renk: secilenRenk,
    );
    utils.updateKayit(xKayit);
    kayitList = await utils.kayitlar();
    print(kayitList);
    dgGetir();
  }

  _onPressedAdd() async {
    final xKayit = dbModel(
      id: 1,
      ekran: "ilkEkran",
      renk: secilenRenk,
    );
    utils.insertKayit(xKayit);
    kayitList = await utils.kayitlar();
    print(kayitList);
    dgGetir();
  }

  void dbKaydet(){
    if (kayitList.length>0)
      _onPressedUpdate();
    else _onPressedAdd();
  }
  void dgGetir() async {
    await utils.kayitlar().then((result) =>
    {
      setState(() {
        kayitList = result;
      })
    });
    gelenRenk = kayitList[0].renk;
    if (gelenRenk == null) gelenRenk=1;
  }
  @override
  Widget build(BuildContext context) {
    //******************************************************************
    // Kullanici Kontrol ***********************************************
    //******************************************************************
    String intKulID;
    Kullanicilar listKullanici;
     listKullanici = ModalRoute.of(context).settings.arguments;
    if (listKullanici== null)
      Navigator.of(context).popUntil((route) => route.isFirst);
    //******************************************************************
    //******************************************************************
    dgGetir();
    return Scaffold(
        appBar: AppBar(
        title: Text('Üniversite Bilgi Sistemi'),
    centerTitle: true,
          backgroundColor: olusanRenk[gelenRenk],
    ),
    drawer: listKullanici.kl_kul_tipi == 1
        ? menuG(listKullanici)
        : menuO(listKullanici),
    body: Container(
      color: Colors.blue[100],
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                color:olusanRenk[secilenRenk],
                child: Text("Seçilen Renk"),),
              Container(
                width: 200,
                color:olusanRenk[gelenRenk],
                child: Text("Kayıtlı Renk"),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: DropDownFormField(
                  titleText: 'Menü Rengi Seçimi',
                  hintText: 'Renk seçiniz',
                  value: secilenRenk,
                  onSaved: (value) {
                    setState(() {
                      secilenRenk = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      secilenRenk = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "blue",
                      "value": 1,
                    },
                    {
                      "display": "red",
                      "value": 2,
                    },
                    {
                      "display": "yellow",
                      "value": 3,
                    },
                    {
                      "display": "green",
                      "value": 4,
                    },
                    {
                      "display": "black",
                      "value": 5,
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                    child: Text("Menü Rengini Değiştir."),
                    onPressed: dbKaydet),
              ),
            ],
          ),

        ],
      )
    )
    );
  }
}
