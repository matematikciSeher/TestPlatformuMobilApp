import 'package:flutter/material.dart';
import 'base_ders.dart';

class BiyolojiDersi extends BaseDers {
  @override
  final String isim = 'Biyoloji';

  @override
  final IconData ikon = Icons.eco;

  @override
  final Color renk = const Color(0xFF8BC34A);

  @override
  final String soz = 'Biyoloji, yaşamı anlamanın yoludur.';

  @override
  final String yazar = 'Rachel Carson';

  @override
  final String strateji =
      'Biyoloji testlerinde:\n• Terimleri iyi öğrenin\n• Şekilleri dikkatle inceleyin\n• Sınıflandırmaları ezberleyin\n• Güncel konuları takip edin';

  @override
  Map<String, List<String>> getKonular() {
    return {
      '9. Sınıf': [
        'Yaşam Bilimi Biyoloji',
        'Hücre',
        'Canlılar Dünyası',
        'Güncel Çevre Sorunları',
        'Doğal Kaynaklar ve Biyolojik Çeşitlilik',
        'Sağlıklı Yaşam',
      ],
      '10. Sınıf': [
        'Hücre Bölünmeleri',
        'Üreme Sistemi ve Embriyonik Gelişim',
        'Komünite ve Popülasyon Ekolojisi',
        'Güncel Çevre Sorunları',
        'Sistemler',
        'Genetik Mühendisliği ve Biyoteknoloji',
      ],
      '11. Sınıf': [
        'İnsan Fizyolojisi',
        'Endokrin Sistem',
        'Duyu Organları',
        'Destek ve Hareket Sistemi',
        'Sindirim Sistemi',
        'Dolaşım Sistemi',
      ],
      '12. Sınıf': [
        'Genden Proteine',
        'Genetik Mühendisliği ve Biyoteknoloji',
        'Canlılık ve Enerji',
        'Bitki Biyolojisi',
        'Komünite ve Popülasyon Ekolojisi',
        'Güncel Çevre Sorunları',
      ],
      'TYT': [
        'Yaşam Bilimi Biyoloji',
        'Hücre',
        'Canlılar Dünyası',
        'Güncel Çevre Sorunları',
        'Doğal Kaynaklar ve Biyolojik Çeşitlilik',
        'Sağlıklı Yaşam',
      ],
      'AYT': [
        'İnsan Fizyolojisi',
        'Endokrin Sistem',
        'Duyu Organları',
        'Destek ve Hareket Sistemi',
        'Sindirim Sistemi',
        'Genetik Mühendisliği ve Biyoteknoloji',
      ],
    };
  }
}
