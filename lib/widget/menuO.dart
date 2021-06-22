import 'package:flutter/material.dart';
import 'package:unisis/ekranlar/ayarlar.dart';
import 'package:unisis/ekranlar/duyurular.dart';
import 'package:unisis/ekranlar/notlar.dart';
import 'package:unisis/ekranlar/sinavtarihleri.dart';
import 'package:unisis/siniflar/c_siniflar.dart';
import 'package:unisis/ekranlar/ogrencibilgi.dart';
import 'package:unisis/ekranlar/notgrafik.dart';
class menuO extends StatelessWidget {
final Kullanicilar listKullanici;
   menuO(this.listKullanici);
  @override

Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_box_outlined,
                    color: Colors.white,
                    size: 100.0,
                  ),
                  Text(
                    "${listKullanici.kl_adi} ${listKullanici.kl_soyadi}",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Anasayfa'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          ListTile(
            leading: Icon(Icons.add_alarm_rounded),
            title: Text('Duyurular'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                  context,
              MaterialPageRoute(
                  builder: (context) => duyurularGPage(),
                  settings: RouteSettings(arguments: listKullanici))
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Öğrenci Bilgileri'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ogrenciBilgiPage(),
                      settings: RouteSettings(arguments: listKullanici))
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_chart),
            title: Text('Notlar'),
            trailing: Icon(Icons.arrow_right),
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => notlarPage(),
                    settings: RouteSettings(arguments: listKullanici))
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_chart),
            title: Text('Notlar Grafik'),
            trailing: Icon(Icons.arrow_right),
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => notgrafikPage(),
                    settings: RouteSettings(arguments: listKullanici))
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.article_outlined),
            title: Text('Sınav Tarihleri'),
            trailing: Icon(Icons.arrow_right),
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => sinavtarihleriPage(),
                    settings: RouteSettings(arguments: listKullanici))
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.wysiwyg),
            title: Text('Ayarlar'),
            trailing: Icon(Icons.arrow_right),
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ayarlarPage(),
                    settings: RouteSettings(arguments: listKullanici))
            );
            },
          ),
        ],
      ),
    );
  }
}
