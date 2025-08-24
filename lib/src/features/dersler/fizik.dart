import 'package:flutter/material.dart';
import 'base_ders.dart';

class FizikDersi extends BaseDers {
  @override
  final String isim = 'Fizik';

  @override
  final IconData ikon = Icons.science;

  @override
  final Color renk = const Color(0xFF2196F3);

  @override
  final String soz = 'Fizik, doğanın sırlarını çözmenin anahtarıdır.';

  @override
  final String yazar = 'Stephen Hawking';

  @override
  final String strateji =
      'Fizik testlerinde:\n• Formülleri ezberleyin\n• Birim analizi yapın\n• Şekil çizin\n• Mantıklı tahminler yapın';

  @override
  Map<String, List<String>> getKonular() {
    return {
      '9. Sınıf': [
        'Fizik Bilimine Giriş',
        'Madde ve Özellikleri',
        'Hareket ve Kuvvet',
        'Enerji',
        'Isı ve Sıcaklık',
        'Elektrik ve Manyetizma',
      ],
      '10. Sınıf': [
        'Elektrik ve Manyetizma',
        'Dalgalar',
        'Optik',
        'Modern Fizik',
        'Atom Fiziği',
        'Nükleer Fizik',
      ],
      '11. Sınıf': [
        'Kuvvet ve Hareket',
        'Elektrik ve Manyetizma',
        'Dalgalar',
        'Optik',
        'Modern Fizik',
        'Atom Fiziği',
      ],
      '12. Sınıf': [
        'Çembersel Hareket',
        'Basit Harmonik Hareket',
        'Dalga Mekaniği',
        'Atom Fiziğine Giriş',
        'Modern Fizik',
        'Modern Fiziğin Teknolojideki Uygulamaları',
      ],
      'TYT': [
        'Fizik Bilimine Giriş',
        'Madde ve Özellikleri',
        'Hareket ve Kuvvet',
        'Enerji',
        'Isı ve Sıcaklık',
        'Elektrik ve Manyetizma',
      ],
      'AYT': [
        'Kuvvet ve Hareket',
        'Elektrik ve Manyetizma',
        'Dalgalar',
        'Optik',
        'Modern Fizik',
        'Atom Fiziği',
      ],
    };
  }
}
