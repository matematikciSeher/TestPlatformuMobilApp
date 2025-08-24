import 'package:flutter/material.dart';
import 'base_ders.dart';

class CografyaDersi extends BaseDers {
  @override
  final String isim = 'Coğrafya';

  @override
  final IconData ikon = Icons.map;

  @override
  final Color renk = const Color(0xFF009688);

  @override
  final String soz = 'Coğrafya, dünyayı keşfetmenin pusulasıdır.';

  @override
  final String yazar = 'Piri Reis';

  @override
  final String strateji =
      'Coğrafya testlerinde:\n• Haritaları iyi inceleyin\n• İklim tiplerini öğrenin\n• Nüfus verilerini analiz edin\n• Güncel olayları takip edin';

  @override
  Map<String, List<String>> getKonular() {
    return {
      '9. Sınıf': [
        'Doğal Sistemler',
        'Beşeri Sistemler',
        'Mekânsal Sentez Türkiye',
        'Küresel Ortam: Bölgeler ve Ülkeler',
        'Çevre ve Toplum',
        'Geleceğin Dünyası',
      ],
      '10. Sınıf': [
        'Doğal Sistemler',
        'Beşeri Sistemler',
        'Mekânsal Sentez Türkiye',
        'Küresel Ortam: Bölgeler ve Ülkeler',
        'Çevre ve Toplum',
        'Geleceğin Dünyası',
      ],
      '11. Sınıf': [
        'Doğal Sistemler',
        'Beşeri Sistemler',
        'Mekânsal Sentez Türkiye',
        'Küresel Ortam: Bölgeler ve Ülkeler',
        'Çevre ve Toplum',
        'Geleceğin Dünyası',
      ],
      '12. Sınıf': [
        'Doğal Sistemler',
        'Beşeri Sistemler',
        'Mekânsal Sentez Türkiye',
        'Küresel Ortam: Bölgeler ve Ülkeler',
        'Çevre ve Toplum',
        'Geleceğin Dünyası',
      ],
      'TYT': [
        'Doğal Sistemler',
        'Beşeri Sistemler',
        'Mekânsal Sentez Türkiye',
        'Küresel Ortam: Bölgeler ve Ülkeler',
        'Çevre ve Toplum',
        'Geleceğin Dünyası',
      ],
      'AYT': [
        'Doğal Sistemler',
        'Beşeri Sistemler',
        'Mekânsal Sentez Türkiye',
        'Küresel Ortam: Bölgeler ve Ülkeler',
        'Çevre ve Toplum',
        'Geleceğin Dünyası',
      ],
    };
  }
}
