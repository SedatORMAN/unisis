import 'package:flutter/material.dart';

class hataPage extends StatelessWidget {
  String strHataMesaj;
  hataPage (this.strHataMesaj);
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        body:Container(
          color: Colors.blue[300],
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child:Text("$strHataMesaj",style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
              FlatButton(
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
            ],
          ),

        ),
    );
  }
}
