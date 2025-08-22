import 'package:flutter/material.dart';
import 'base_sinif.dart';

class OnIkinciSinif extends BaseSinif {
  @override
  final String isim = '12. Sınıf';

  @override
  final Color renk = const Color(0xFFE91E63);

  @override
  Map<String, List<Map<String, dynamic>>> get curriculumTopics => {
    'Matematik': [
      {
        'topic': 'İntegral Uygulamaları',
        'color': Colors.purple,
        'icon': Icons.integration_instructions,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Belirsiz İntegral',
        'color': Colors.blue,
        'icon': Icons.calculate,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Belirli İntegral',
        'color': Colors.green,
        'icon': Icons.functions,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Alan ve Hacim',
        'color': Colors.orange,
        'icon': Icons.area_chart,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Diferansiyel Denklemler',
        'color': Colors.red,
        'icon': Icons.trending_up,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Uzay Geometrisi',
        'color': Colors.teal,
        'icon': Icons.view_in_ar,
        'difficulty': 'Zor',
      },
    ],
    'Fizik': [
      {
        'topic': 'Çembersel Hareket',
        'color': Colors.indigo,
        'icon': Icons.rotate_right,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Basit Harmonik Hareket',
        'color': Colors.cyan,
        'icon': Icons.waves,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Dalga Mekaniği',
        'color': Colors.amber,
        'icon': Icons.waves,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Atom Fiziğine Giriş',
        'color': Colors.lime,
        'icon': Icons.science,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Modern Fizik',
        'color': Colors.deepOrange,
        'icon': Icons.science,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Modern Fiziğin Teknolojideki Uygulamaları',
        'color': Colors.pink,
        'icon': Icons.phone_android,
        'difficulty': 'Zor',
      },
    ],
    'Kimya': [
      {
        'topic': 'Organik Bileşikler',
        'color': Colors.deepPurple,
        'icon': Icons.eco,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Enerji Kaynakları ve Bilimsel Gelişmeler',
        'color': Colors.blueGrey,
        'icon': Icons.flash_on,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Kimya ve Enerji',
        'color': Colors.indigo,
        'icon': Icons.battery_charging_full,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Hayatımızda Kimya',
        'color': Colors.teal,
        'icon': Icons.home,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Kimya ve Çevre',
        'color': Colors.cyan,
        'icon': Icons.eco,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Kimya ve Teknoloji',
        'color': Colors.orange,
        'icon': Icons.computer,
        'difficulty': 'Orta',
      },
    ],
    'Biyoloji': [
      {
        'topic': 'Genden Proteine',
        'color': Colors.green,
        'icon': Icons.science,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Genetik Mühendisliği ve Biyoteknoloji',
        'color': Colors.lightGreen,
        'icon': Icons.biotech,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Canlılık ve Enerji',
        'color': Colors.teal,
        'icon': Icons.flash_on,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Bitki Biyolojisi',
        'color': Colors.blue,
        'icon': Icons.eco,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Komünite ve Popülasyon Ekolojisi',
        'color': Colors.brown,
        'icon': Icons.group,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Güncel Çevre Sorunları',
        'color': Colors.red,
        'icon': Icons.nature,
        'difficulty': 'Kolay',
      },
    ],
    'Tarih': [
      {
        'topic': 'XX. Yüzyıl Başlarında Osmanlı Devleti ve Dünya',
        'color': Colors.brown,
        'icon': Icons.history,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Millî Mücadele',
        'color': Colors.orange,
        'icon': Icons.flag,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Atatürkçülük ve Türk İnkılabı',
        'color': Colors.grey,
        'icon': Icons.change_history,
        'difficulty': 'Zor',
      },
      {
        'topic': 'İki Savaş Arasındaki Dönemde Türkiye ve Dünya',
        'color': Colors.amber,
        'icon': Icons.public,
        'difficulty': 'Zor',
      },
      {
        'topic': 'II. Dünya Savaşı Sürecinde Türkiye ve Dünya',
        'color': Colors.green,
        'icon': Icons.security,
        'difficulty': 'Zor',
      },
      {
        'topic': 'II. Dünya Savaşı Sonrasında Türkiye ve Dünya',
        'color': Colors.blue,
        'icon': Icons.trending_up,
        'difficulty': 'Zor',
      },
    ],
    'Coğrafya': [
      {
        'topic': 'Doğal Sistemler',
        'color': Colors.green,
        'icon': Icons.landscape,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Beşeri Sistemler',
        'color': Colors.blue,
        'icon': Icons.location_city,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Mekânsal Sentez Türkiye',
        'color': Colors.red,
        'icon': Icons.map,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Küresel Ortam: Bölgeler ve Ülkeler',
        'color': Colors.purple,
        'icon': Icons.public,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Çevre ve Toplum',
        'color': Colors.teal,
        'icon': Icons.eco,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Geleceğin Dünyası',
        'color': Colors.orange,
        'icon': Icons.trending_up,
        'difficulty': 'Kolay',
      },
    ],
    'Edebiyat': [
      {
        'topic': 'Hikâye',
        'color': Colors.indigo,
        'icon': Icons.auto_stories,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Şiir',
        'color': Colors.purple,
        'icon': Icons.auto_stories,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Roman',
        'color': Colors.pink,
        'icon': Icons.library_books,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Tiyatro',
        'color': Colors.deepPurple,
        'icon': Icons.theater_comedy,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Deneme',
        'color': Colors.amber,
        'icon': Icons.edit_note,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Söylev (Nutuk)',
        'color': Colors.blue,
        'icon': Icons.record_voice_over,
        'difficulty': 'Zor',
      },
    ],
  };
}
