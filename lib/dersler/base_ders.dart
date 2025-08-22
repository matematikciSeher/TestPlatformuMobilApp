import 'package:flutter/material.dart';

abstract class BaseDers {
  String get isim;
  IconData get ikon;
  Color get renk;
  String get soz;
  String get yazar;
  String get strateji;
  
  Map<String, List<String>> getKonular();
}
