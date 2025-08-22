import 'package:flutter/material.dart';
import 'base_ders.dart';

class EdebiyatDersi extends BaseDers {
  @override
  final String isim = 'Edebiyat';

  @override
  final IconData ikon = Icons.book;

  @override
  final Color renk = const Color(0xFF9C27B0);

  @override
  final String soz = 'Edebiyat, insan ruhunun en derin sesidir.';

  @override
  final String yazar = 'Ahmet Hamdi Tanpınar';

  @override
  final String strateji =
      'Edebiyat testlerinde:\n• Eserleri ve yazarları öğrenin\n• Dönem özelliklerini bilin\n• Şiir türlerini ayırt edin\n• Anlatım tekniklerini tanıyın';

  @override
  Map<String, List<String>> getKonular() {
    return {
      '9. Sınıf': [
        'Türk Dili ve Edebiyatına Giriş',
        'Hikâye',
        'Şiir',
        'Roman',
        'Tiyatro',
        'Deneme',
      ],
      '10. Sınıf': [
        'Hikâye',
        'Şiir',
        'Roman',
        'Tiyatro',
        'Deneme',
        'Söylev (Nutuk)',
      ],
      '11. Sınıf': [
        'Hikâye',
        'Şiir',
        'Roman',
        'Tiyatro',
        'Deneme',
        'Söylev (Nutuk)',
      ],
      '12. Sınıf': [
        'Hikâye',
        'Şiir',
        'Roman',
        'Tiyatro',
        'Deneme',
        'Söylev (Nutuk)',
      ],
      'TYT': [
        'Türk Dili ve Edebiyatına Giriş',
        'Hikâye',
        'Şiir',
        'Roman',
        'Tiyatro',
        'Deneme',
      ],
      'AYT': ['Hikâye', 'Şiir', 'Roman', 'Tiyatro', 'Deneme', 'Söylev (Nutuk)'],
    };
  }
}
