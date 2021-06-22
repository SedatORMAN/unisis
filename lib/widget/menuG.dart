import 'package:flutter/material.dart';
import 'package:unisis/ekranlar/duyurular.dart';
import 'package:unisis/siniflar/c_siniflar.dart';

class menuG extends StatelessWidget {
final Kullanicilar listKullanici;
   menuG(this.listKullanici);
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
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => duyurularGPage(),
                    settings: RouteSettings(arguments: listKullanici))
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Kişisel Bilgiler'),
            trailing: Icon(Icons.arrow_right),
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => duyurularGPage(),
                    settings: RouteSettings(arguments: listKullanici))
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_chart),
            title: Text('Not Girişi'),
            trailing: Icon(Icons.arrow_right),
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => duyurularGPage(),
                    settings: RouteSettings(arguments: listKullanici))
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.article_outlined),
            title: Text('Sınav Tarihi Girişi'),
            trailing: Icon(Icons.arrow_right),
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => duyurularGPage(),
                    settings: RouteSettings(arguments: listKullanici))
            );
            },
          ),
        ],
      ),
    );
  }
}
