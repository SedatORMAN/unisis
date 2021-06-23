import 'package:flutter/material.dart';

class hakkindaPage extends StatefulWidget {
  @override
  _hakkindaPageState createState() => _hakkindaPageState();
}

class _hakkindaPageState extends State<hakkindaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.blue[300],
        child: Center(
          child: Container(
            height: 160,
            child: Card(
              elevation: 3,
              color: Colors.white,
              margin: EdgeInsets.only(left: 5, right: 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "     Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 203311096 numaralı Sedat ORMAN tarafından 25 Haziran 2021 günü yapılmıştır.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          top: 8,
                          right: 10,
                          bottom: 8,
                        ),
                        child: Text(
                          "Geri Dön",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      color: Colors.blue[400],
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
