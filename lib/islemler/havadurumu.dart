
import 'dart:convert';

import 'package:http/http.dart';

const apiKey="49d3a6b4bf5795a2b05900e7fa0d9f67";

class havaDurumuVeri{
  double suankiSicaklik;
  String suankiDurum;
  Future<void> getirSuAnkiSicakligi() async {
    Response response = await get("https://api.openweathermap.org/data/2.5/weather?lat=39.965894&lon=32.831748&appid=49d3a6b4bf5795a2b05900e7fa0d9f67&units=metric&lang=tr");
 if (response.statusCode==200){
   String data = response.body;
   var suAnkiHavaDurumu = jsonDecode(data);
   try{

     suankiSicaklik = suAnkiHavaDurumu['main']['temp'];
     suankiDurum = suAnkiHavaDurumu['weather'][0]['description'];
     print (suankiSicaklik.toString());
   }
   catch(e) {
     print(e);
   }
 }
 else {
   print("Apiden değer gelmiyor");
 }
  }

}