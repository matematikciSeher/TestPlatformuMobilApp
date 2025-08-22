import 'package:flutter/material.dart';
import 'base_sinif.dart';

class OnuncuSinif extends BaseSinif {
  @override
  final String isim = '10. Sınıf';

  @override
  final Color renk = const Color(0xFF4CAF50);

  @override
  Map<String, List<Map<String, dynamic>>> get curriculumTopics => {
    'Matematik': [
      {
        'topic': 'Polinomlar',
        'color': Colors.purple,
        'icon': Icons.functions,
        'difficulty': 'Orta',
      },
      {
        'topic': 'İkinci Dereceden Denklemler',
        'color': Colors.blue,
        'icon': Icons.calculate,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Trigonometri',
        'color': Colors.green,
        'icon': Icons.change_history,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Logaritma',
        'color': Colors.orange,
        'icon': Icons.trending_up,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Permütasyon ve Kombinasyon',
        'color': Colors.red,
        'icon': Icons.shuffle,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Olasılık',
        'color': Colors.teal,
        'icon': Icons.casino,
        'difficulty': 'Orta',
      },
    ],
    'Fizik': [
      {
        'topic': 'Elektrik ve Manyetizma',
        'color': Colors.indigo,
        'icon': Icons.electric_bolt,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Dalgalar',
        'color': Colors.cyan,
        'icon': Icons.waves,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Optik',
        'color': Colors.amber,
        'icon': Icons.visibility,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Modern Fizik',
        'color': Colors.lime,
        'icon': Icons.science,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Atom Fiziği',
        'color': Colors.deepOrange,
        'icon': Icons.circle,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Nükleer Fizik',
        'color': Colors.pink,
        'icon': Icons.science,
        'difficulty': 'Zor',
      },
    ],
    'Kimya': [
      {
        'topic': 'Karışımlar',
        'color': Colors.deepPurple,
        'icon': Icons.blur_on,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Asitler, Bazlar ve Tuzlar',
        'color': Colors.blueGrey,
        'icon': Icons.science,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Karışımların Ayrılması',
        'color': Colors.indigo,
        'icon': Icons.filter_alt,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Endüstride ve Canlılarda Enerji',
        'color': Colors.teal,
        'icon': Icons.flash_on,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Kimya Her Yerde',
        'color': Colors.cyan,
        'icon': Icons.location_on,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Organik Bileşikler',
        'color': Colors.orange,
        'icon': Icons.eco,
        'difficulty': 'Zor',
      },
    ],
    'Biyoloji': [
      {
        'topic': 'Hücre Bölünmeleri',
        'color': Colors.green,
        'icon': Icons.cell_tower,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Üreme Sistemi ve Embriyonik Gelişim',
        'color': Colors.lightGreen,
        'icon': Icons.favorite,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Komünite ve Popülasyon Ekolojisi',
        'color': Colors.teal,
        'icon': Icons.group,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Güncel Çevre Sorunları',
        'color': Colors.blue,
        'icon': Icons.nature,
        'difficulty': 'Kolay',
      },
      {
        'topic': 'Sistemler',
        'color': Colors.brown,
        'icon': Icons.architecture,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Genetik Mühendisliği ve Biyoteknoloji',
        'color': Colors.red,
        'icon': Icons.biotech,
        'difficulty': 'Zor',
      },
    ],
    'Tarih': [
      {
        'topic': 'Yerleşme ve Devletleşme Sürecinde Selçuklu Türkiyesi',
        'color': Colors.brown,
        'icon': Icons.history,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Beylikten Devlete Osmanlı Siyaseti',
        'color': Colors.orange,
        'icon': Icons.flag,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Devletleşme Sürecinde Savaşçılar ve Askerler',
        'color': Colors.grey,
        'icon': Icons.security,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Beylikten Devlete Osmanlı Medeniyeti',
        'color': Colors.amber,
        'icon': Icons.mosque,
        'difficulty': 'Zor',
      },
      {
        'topic': 'Dünya Gücü Osmanlı',
        'color': Colors.green,
        'icon': Icons.public,
        'difficulty': 'Orta',
      },
      {
        'topic': 'Sultan ve Osmanlı Merkez Teşkilatı',
        'color': Colors.blue,
        'icon': Icons.account_balance,
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
