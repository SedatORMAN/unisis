import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class dosyaIslemleri {

  static Future<String> get getDosyaYolu async {
    final dizin = await getApplicationDocumentsDirectory();
    return dizin.path;
  }
  static Future<File> get getDosya async {
    final yol = await getDosyaYolu;
    return File('$yol/myfile.txt');
  }
  static Future<File> dosyayaKaydet(String veri) async {
    final dosya = await getDosya;
    return dosya.writeAsString(veri);
  }
  static Future<String> dosyadanOku() async {
    try {
      final dosya = await getDosya;
      String fileContents = await dosya.readAsString();
      return fileContents;
    } catch (e) {
      return "";
    }
  }
  }