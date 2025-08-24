import 'package:flutter/material.dart';
import 'base_ders.dart';

class MatematikDersi extends BaseDers {
  @override
  final String isim = 'Matematik';

  @override
  final IconData ikon = Icons.functions;

  @override
  final Color renk = const Color(0xFFE91E63);

  @override
  final String soz = 'Matematik, evrenin gizli müziğidir.';

  @override
  final String yazar = 'Leopold Kronecker';

  @override
  final String strateji =
      'Matematik testlerinde:\n• Formülleri iyi öğrenin\n• Adım adım çözün\n• Kontrol edin\n• Zaman yönetimi yapın';

  @override
  Map<String, List<String>> getKonular() {
    return {
      '9. Sınıf': [
        'Kümeler ve Kartezyen Çarpım',
        'Sayılar ve Cebir',
        'Denklemler ve Eşitsizlikler',
        'Fonksiyonlar',
        'Üçgenler ve Trigonometri',
        'Veri Analizi',
      ],
      '10. Sınıf': [
        'Polinomlar',
        'İkinci Dereceden Denklemler',
        'Trigonometri',
        'Logaritma',
        'Permütasyon ve Kombinasyon',
        'Olasılık',
      ],
      '11. Sınıf': [
        'Türev',
        'İntegral',
        'Limit',
        'Süreklilik',
        'Türev Uygulamaları',
        'İntegral Uygulamaları',
      ],
      '12. Sınıf': [
        'İntegral Uygulamaları',
        'Belirsiz İntegral',
        'Belirli İntegral',
        'Alan ve Hacim',
        'Diferansiyel Denklemler',
        'Uzay Geometrisi',
      ],
      'TYT': [
        'Temel Matematik',
        'Sayılar',
        'Cebir',
        'Geometri',
        'Problemler',
        'Veri Analizi',
      ],
      'AYT': [
        'Türev',
        'İntegral',
        'Limit',
        'Trigonometri',
        'Logaritma',
        'Permütasyon ve Kombinasyon',
      ],
    };
  }
}
