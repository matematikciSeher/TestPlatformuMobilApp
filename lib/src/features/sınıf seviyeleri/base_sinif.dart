import 'package:flutter/material.dart';

abstract class BaseSinif {
  String get isim;
  Color get renk;

  Map<String, List<Map<String, dynamic>>> get curriculumTopics;
}
